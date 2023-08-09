import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';

late FocusNode _pointsNode;

class ConfirmProductPage extends StatelessWidget {
  final String? bearerToken;

  const ConfirmProductPage({this.bearerToken, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartState(),
      child: Consumer<CartState>(
        builder: (_, state, __) {
          return AppSecondaryBar(
            title: 'Checkout',
            body: _Body(),
            backgroundColor: backgroundColor,
            bottomNavigationBar: _BottomNavigationBar(
              bearerToken: bearerToken,
            ),
          );
        },
      ),
    );
  }
}

class _Body extends StatefulWidget {
  final String? bearerToken;

  const _Body({this.bearerToken, Key? key}) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    final state = context.read<CartState>();

    await Future.delayed(Duration(milliseconds: 1000));

    state.getSemua();

    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    initState();

    _refreshController.loadComplete();
  }

  @override
  void initState() {
    super.initState();

    final state = context.read<CartState>();
    _pointsNode = FocusNode();

    state.getSemua();
    state.bearerToken = widget.bearerToken;

    print('confirm ${widget.bearerToken}');
  }

  @override
  void dispose() {
    _pointsNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      physics: ScrollPhysics(),
      enablePullDown: true,
      header: WaterDropHeader(),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: Consumer<CartState>(
        builder: (_, state, __) {
          return state.isLoading
              ? AppLoadingOverlay()
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        if (state.bearerToken != null) ...[
                          state.orderDetailsPremis!.length > 1
                              ? Container()
                              : _SelfCollect(),
                          _ConfirmAddress(),
                          state.selfCollect == true ? Container() : _Shipping(),
                          _Divider(),
                          _Products(),
                        ] else ...[
                          state.orderDetailsPremis!.length > 1
                              ? Container()
                              : _SelfCollect(),
                          _ConfirmDeliveryInformationGuest(),
                          state.selfCollect == true ? Container() : _Shipping(),
                          _Divider(),
                          _Products(),
                        ]
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}

class _ConfirmDeliveryInformationGuest extends StatelessWidget {
  const _ConfirmDeliveryInformationGuest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartState>(
      builder: (_, state, __) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: AppSize.mainSpaceBetween,
              children: [
                Row(
                  crossAxisAlignment: AppSize.crossStart,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: primaryColor,
                      size: AppSize.heightScreen(context) * 0.04,
                    ),
                    Column(
                      crossAxisAlignment: AppSize.crossStart,
                      children: [
                        Row(
                          children: [
                            TextManrope(text: 'Delivery Information'),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        state.isInformationComplete == false
                            ? TextManrope(
                                text: '*Please complete this section',
                                color: Colors.red,
                                fontSize: 10,
                              )
                            : _ShippingInformationGuest(),
                      ],
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    AppRoute.push(context, DeliveryInformationGuestPage());
                  },
                  child: CircleAvatar(
                      backgroundColor: primaryColor,
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        );
      },
    );
  }
}

class _SelfCollect extends StatelessWidget {
  const _SelfCollect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartState>(
      builder: (_, state, __) {
        return AppCheckBox(
          value: state.selfCollect,
          onChange: (v) => state.selfCollect = v!,
          title: 'Self Collect',
        );
      },
    );
  }
}

class _ConfirmAddress extends StatelessWidget {
  const _ConfirmAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartState>(
      builder: (_, state, __) {
        return state.selfCollect == true
            ? Container()
            : Column(
                children: [
                  Row(
                    crossAxisAlignment: AppSize.crossStart,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: primaryColor,
                        size: AppSize.heightScreen(context) * 0.04,
                      ),
                      Column(
                        crossAxisAlignment: AppSize.crossStart,
                        children: [
                          Row(
                            children: [
                              TextManrope(text: 'Delivery Address'),
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          _Address(),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          AppRoute.push(context, EditAddressPage());
                        },
                        child: CircleAvatar(
                            backgroundColor: primaryColor,
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            )),
                      ),
                      // TextManrope(
                      //   text: 'Edit',
                      //   color: Colors.red,
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              );
      },
    );
  }
}

class _Address extends StatelessWidget {
  const _Address({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartState>(
      builder: (_, state, __) {
        return Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: AppSize.widthScreen(context) * 0.75,
                  child: TextManrope(
                      textAlign: TextAlign.left,
                      maxLines: 10,
                      text: state.address![0].alamat3! != ''
                          ? '${state.address![0].alamat!}, ' +
                              '${state.address![0].alamat2!}, ' +
                              '${state.address![0].alamat3!}, ' +
                              '${state.address![0].poskod!}, ' +
                              '${state.address![1].pilihanLabel!}, ' +
                              '${state.address![0].pilihanLabel!}'
                          : '${state.address![0].alamat!}, ' +
                              '${state.address![0].alamat2!}, ' +
                              '${state.address![0].poskod!}, ' +
                              '${state.address![1].pilihanLabel!}, ' +
                              '${state.address![0].pilihanLabel!}'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _ShippingInformationGuest extends StatelessWidget {
  const _ShippingInformationGuest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartState>(
      builder: (_, state, __) {
        return Container(
          width: AppSize.widthScreen(context) * 0.7,
          child: Column(
            crossAxisAlignment: AppSize.crossStart,
            children: [
              TextManrope(
                text: state.guestName.capitalizeFirstofEach,
                fontSize: 14,
                textAlign: TextAlign.left,
              ),
              TextManrope(
                text: state.guestNoPhone,
                fontSize: 12,
                fontStyle: FontStyle.italic,
                textAlign: TextAlign.left,
              ),
              TextManrope(
                text: state.guestEmail,
                fontSize: 12,
                fontStyle: FontStyle.italic,
                textAlign: TextAlign.left,
              ),
              TextManrope(
                text: state.guestAddress != ''
                    ? '${state.guestAddress}, '
                        '${state.guestPostcode}, '
                        '${state.guestBandar}, ${state.currentDaerah![0].pilihanLabel}, '
                        '${state.currentNegeri![0].pilihanLabel}'
                    : '',
                fontSize: 12,
                fontStyle: FontStyle.italic,
                maxLines: 5,
                textAlign: TextAlign.left,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Products extends StatelessWidget {
  const _Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartState>(
      builder: (_, state, __) {
        return state.cartList == null
            ? Container()
            : Column(
                children: [
                  ...List.generate(
                      state.cartList!.length,
                      (i) => _ProductConfirmCard(
                            productName: state.cartList![i].name,
                            price: state.cartList![i].harga,
                            image: state.cartList![i].image,
                            quantity: state.cartList![i].kuantiti,
                            berat: state.cartList![i].beratProduk,
                            namaPremis: state.cartList![i].namaPremis,
                          ))
                ],
              );
      },
    );
  }
}

class _ProductConfirmCard extends StatelessWidget {
  final String? image;
  final String? productName;
  final String? price;
  final String? quantity;
  final String? berat;
  final String? namaPremis;

  const _ProductConfirmCard(
      {this.image,
      this.productName,
      this.price,
      this.quantity,
      this.berat,
      this.namaPremis,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
                height: AppSize.heightScreen(context) * 0.1,
                width: AppSize.widthScreen(context) * 0.2,
                child: Image.network(
                  imageURl + image!,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: AppSize.crossStart,
              children: [
                SizedBox(
                  width: AppSize.widthScreen(context) * 0.7,
                  child: TextManrope(
                    text: '${productName!} x $quantity',
                    maxLines: 5,
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                TextManrope(text: 'RM$price'),
                TextManrope(
                  text: namaPremis!,
                  fontSize: 10,
                ),
                TextManrope(
                  text: '${double.parse(berat!) / 1000}KG',
                  fontSize: 10,
                  fontStyle: FontStyle.italic,
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 4,
        ),
      ],
    );
  }
}

class _Shipping extends StatelessWidget {
  const _Shipping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartState>(
      builder: (_, state, __) {
        return state.courierList == null
            ? Container()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppSelectField(
                  width: AppSize.widthScreen(context),
                  label: 'Courier',
                  hint: 'Choose courier...',
                  items: _mapItems(state),
                  onChange: (v) => state.courier = v,
                  errorText: state.courierHasError ? state.courierError : null,
                ),
              );
      },
    );
  }

  _mapItems(state) {
    List list = state.courierList;
    return list
        .map((item) => appDropDownMenuItem(item.perkhidmatanKurier, item))
        .toList();
  }
}

class _BottomNavigationBar extends StatelessWidget {
  final String? bearerToken;

  const _BottomNavigationBar({this.bearerToken, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartState>(
      builder: (_, state, __) {
        return state.isLoading
            ? AppLoadingOverlay()
            : Container(
                height: state.usePoints == true
                    ? AppSize.heightScreen(context) * 0.35
                    : AppSize.heightScreen(context) * 0.25,
                child: Column(
                  mainAxisAlignment: AppSize.mainEnd,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: AppSize.widthScreen(context),
                        child: Row(
                          mainAxisAlignment: AppSize.mainSpaceBetween,
                          crossAxisAlignment: AppSize.crossStart,
                          children: [
                            TextManrope(text: 'Other charges'),
                            Column(
                              crossAxisAlignment: AppSize.crossStart,
                              children: [
                                TextManrope(
                                    text: 'Tax: ${state.setting![0].value}%'),
                                state.selfCollect
                                    ? TextManrope(
                                        text: "Shipping Rates: RM0.00")
                                    : TextManrope(
                                        text: state.shippingRates == null
                                            ? "Shipping Rates: RM0.00"
                                            : 'Shipping Rates: RM${state.shippingRatesList.reduce((a, b) => a + b)}'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    state.bearerToken == null
                        ? Container()
                        : Container(
                            color: Colors.white,
                            child: AppCheckBox(
                                value: state.usePoints,
                                onChange: (v) => state.usePoints = v!,
                                title: 'Pay using points',
                                subtitle: TextManrope(
                                  text:
                                      'Hibah balance: ${state.userPoints![0].point!}',
                                )),
                          ),
                    state.bearerToken == null
                        ? Container()
                        : state.usePoints == false
                            ? Container()
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: AppTextFieldWithLabel(
                                  focusNode: _pointsNode,
                                  hint: "insert amount...",
                                  keyboardType: TextInputType.number,
                                  onChange: (v) => state.points = v,
                                  onSubmitted: (v) => state.points = v,
                                  errorText: state.pointsHasError
                                      ? state.pointsError
                                      : null,
                                ),
                              ),
                    Row(
                      children: [
                        Container(
                          width: AppSize.widthScreen(context) * 0.7,
                          height: AppSize.heightScreen(context) * 0.1,
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: AppSize.mainCenter,
                            crossAxisAlignment: AppSize.crossEnd,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                                child: state.cashGiven == null
                                    ? AppLoadingOverlay()
                                    : state.selfCollect
                                        ? TextManrope(
                                            text:
                                                'Total Payment: RM${double.parse(state.cashGiven![0].cashGiven!) + double.parse('0.00') - double.parse(state.points)}')
                                        : state.shippingRates == null
                                            ? TextManrope(
                                                text:
                                                    'Total Payment: RM${double.parse(state.cashGiven![0].cashGiven!) + double.parse('0.00') - double.parse(state.points)}',
                                              )
                                            : TextManrope(
                                                text:
                                                    'Total Payment: RM${double.parse('${double.parse(state.cashGiven![0].cashGiven!) + state.shippingRatesList.reduce((a, b) => a + b) - double.parse(state.points)}').toStringAsFixed(2)}',
                                                maxLines: 2,
                                              ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            print('tekan');
                            state.validateAll();

                            if (bearerToken != null) {
                              if (state.courierHasError) {
                                return;
                              }
                              if (state.pointsHasError) {
                                _pointsNode.requestFocus();
                                return;
                              }
                            } else {
                              if (state.courierHasError) {
                                return;
                              }
                              if (state.pointsHasError) {
                                _pointsNode.requestFocus();
                                return;
                              }
                              if (state.guestName == '') {
                                state.isInformationComplete = false;
                                return;
                              }
                            }

                            state.getPayment(context);
                            // state.simpanOrders();
                          },
                          child: Container(
                            height: AppSize.heightScreen(context) * 0.1,
                            width: AppSize.widthScreen(context) * 0.3,
                            color: primaryColor,
                            child: Column(
                              mainAxisAlignment: AppSize.mainCenter,
                              children: [
                                TextManrope(
                                  text: 'PLACE \nORDER',
                                  maxLines: 2,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
      },
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Container(
        height: 0.3,
        width: AppSize.widthScreen(context),
        color: Colors.black,
      ),
    );
  }
}

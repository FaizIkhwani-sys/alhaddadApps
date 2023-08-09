import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartState(),
      child: AppSecondaryBar(
        title: 'Cart',
        body: _Body(),
        backgroundColor: backgroundColor,
        bottomNavigationBar: _BottomNavigationBar(),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    final state = context.read<CartState>();

    await Future.delayed(Duration(milliseconds: 1000));

    state.getAll();
    state.getSetting();
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

    // state.getAllList();
    state.getAll();
    state.getSetting();
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
              : state.cartList == null
                  ? Center(
                      child: TextManrope(
                        text: 'Your cart is empty',
                      ),
                    )
                  : SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            _Content(),
                            // _SubTotal(),
                          ],
                        ),
                      ),
                    );
        },
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartState>(
      builder: (_, state, __) {
        return Column(
          children: [
            ...List.generate(state.cartList!.length, (i) {
              return Slidable(
                endActionPane: ActionPane(
                  motion: ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) async {
                        print('betul last ${state.cartList![i].id}');
                        await state.deleteCartProduct(
                            context, state.cartList![i].id!);

                        await state.getSubTotal();
                        if (state.orderSubTotal == null) {
                          await state.getCart();
                          if (state.cartList == null) {
                            await state.deleteOrder(context);
                          }
                        } else {
                          await state.updateSubTotal(context);
                          print('update done');
                          await state.getCart();
                          print('getcart done');
                        }
                      },
                      backgroundColor: dangerColor,
                      icon: Icons.delete,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15)),
                    ),
                  ],
                ),
                child: _CartCard(
                  image: imageURl + state.cartList![i].image!,
                  productName: state.cartList![i].name!,
                  quantity: state.cartList![i].kuantiti!,
                  price: state.cartList![i].harga!,
                  idOrderDetails: state.cartList![i].id,
                  pricePerProduct: state.cartList![i].pricePerProduct!,
                  namaPremis: state.cartList![i].namaPremis,
                ),
              );
            })
            // ...List.generate(
            //     state.orderIdList!.length,
            //     (i) => Column(
            //           children: [
            //             TextManrope(text: state.orderIdList![i].id!),
            //             ...List.generate(state.cartList!.length, (j) {
            //               return Slidable(
            //                 endActionPane: ActionPane(
            //                   motion: ScrollMotion(),
            //                   children: [
            //                     SlidableAction(
            //                       onPressed: (context) async {
            //                         print(state.cartList![j].id);
            //                         await state.deleteCartProduct(
            //                             context, state.cartList![j].id!);
            //
            //                         await state.getSubTotal();
            //                         if (state.orderSubTotal == null) {
            //                           await state.getCart();
            //                           if (state.cartList == null) {
            //                             await state.deleteOrder(context);
            //                           }
            //                         } else {
            //                           await state.updateSubTotal(context);
            //                           print('update done');
            //                           await state.getCart();
            //                           print('getcart done');
            //                         }
            //                       },
            //                       backgroundColor: dangerColor,
            //                       icon: Icons.delete,
            //                       borderRadius: BorderRadius.only(
            //                           topLeft: Radius.circular(15),
            //                           bottomLeft: Radius.circular(15)),
            //                     ),
            //                   ],
            //                 ),
            //                 child: _CartCard(
            //                   image: imageURl + state.cartList![j].image!,
            //                   productName: state.cartList![j].name!,
            //                   quantity: state.cartList![j].kuantiti!,
            //                   price: state.cartList![j].harga!,
            //                   idOrderDetails: state.cartList![j].id,
            //                   pricePerProduct:
            //                       state.cartList![j].pricePerProduct!,
            //                   namaPremis: state.cartList![j].namaPremis,
            //                 ),
            //               );
            //             })
            //           ],
            //         ))
          ],
        );
      },
    );
  }
}

class _CartCard extends StatefulWidget {
  final String? image;
  final String? productName;
  final String? quantity;
  final String? price;
  final String? idOrderDetails;
  final String? pricePerProduct;
  final String? namaPremis;

  const _CartCard(
      {this.image,
      this.productName,
      this.quantity,
      this.price,
      this.idOrderDetails,
      this.pricePerProduct,
      this.namaPremis,
      Key? key})
      : super(key: key);

  @override
  State<_CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<_CartCard> {
  int _quantity = 0;
  double _price = 0.0;

  @override
  void initState() {
    super.initState();
    _quantity = int.parse(widget.quantity!);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartState>(
      builder: (_, state, __) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(2, 8, 8, 8),
                child: Row(
                  children: [
                    SizedBox(
                        height: AppSize.heightScreen(context) * 0.15,
                        width: AppSize.widthScreen(context) * 0.3,
                        child: Image.network(
                          widget.image!,
                          fit: BoxFit.cover,
                        )),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Column(
                          mainAxisAlignment: AppSize.mainStart,
                          crossAxisAlignment: AppSize.crossStart,
                          children: [
                            TextManrope(
                              text: widget.productName!,
                              fontSize: 12,
                              maxLines: 5,
                              textAlign: TextAlign.left,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            TextManrope(
                              text: widget.namaPremis!,
                              fontSize: 10,
                              maxLines: 5,
                              textAlign: TextAlign.left,
                            ),
                            TextManrope(
                              text: 'RM${widget.price}',
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              mainAxisAlignment: AppSize.mainEnd,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    if (_quantity > 1) {
                                      setState(() {
                                        _quantity--;
                                        _price = double.parse(
                                                widget.pricePerProduct!) *
                                            _quantity;
                                      });
                                      await state.updateQuantity(
                                          context,
                                          widget.idOrderDetails!,
                                          _quantity.toString(),
                                          _price.toStringAsFixed(2));
                                      await state.getSubTotal();
                                      await state.updateSubTotal(context);
                                      await state.getCart();
                                    }
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10.0),
                                              bottomLeft:
                                                  Radius.circular(10.0)),
                                          color: primaryColor),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Icon(Icons.remove),
                                      )),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                TextManrope(
                                  text: _quantity.toString(),
                                  key: ValueKey<int>(_quantity),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                InkWell(
                                  onTap: () async {
                                    setState(() {
                                      _quantity++;
                                      _price = double.parse(
                                              widget.pricePerProduct!) *
                                          _quantity;
                                    });
                                    await state.updateQuantity(
                                        context,
                                        widget.idOrderDetails!,
                                        _quantity.toString(),
                                        _price.toStringAsFixed(2));
                                    await state.getSubTotal();
                                    await state.updateSubTotal(context);
                                    await state.getCart();
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10.0),
                                              bottomRight:
                                                  Radius.circular(10.0)),
                                          color: primaryColor),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Icon(Icons.add),
                                      )),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartState>(
      builder: (_, state, __) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: AppSubmitButton(
              onTap: () async {
                SharedPreferences _prefs =
                    await SharedPreferences.getInstance();
                String? bearerToken = _prefs.getString('BearerToken');

                if (state.cartList != null) {
                  print('sini jalan . ni bearer dia $bearerToken');
                  AppRoute.push(
                      context,
                      ConfirmProductPage(
                        bearerToken: bearerToken,
                      ));
                } else {
                  await showDialog(
                    context: context,
                    builder: (_) {
                      return Material(
                        color: Colors.transparent,
                        child: AppAlertDialog(
                          alertDialogType: AlertDialogType.info,
                          title: "Ops, sorry",
                          subtitle: '',
                          description: "Please add products to your cart",
                          actionButtons: [
                            ActionButton(
                              label: 'Back',
                              color: secondaryColor,
                              onTap: () {
                                AppRoute.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }

                // state.getPayment(context);
              },
              title: 'CHECK OUT'),
        );
      },
    );
  }
}

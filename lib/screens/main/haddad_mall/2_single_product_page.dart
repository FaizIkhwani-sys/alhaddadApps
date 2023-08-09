import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'dart:io';

class SingleProductPage extends StatelessWidget {
  final String? idProduct;
  final String? productName;
  final String? premisId;
  final String? saleType;

  const SingleProductPage(
      {this.idProduct,
      this.productName,
      this.premisId,
      this.saleType,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HaddadMallState(),
      child: AppSecondaryBar(
        title: productName!,
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
            child: _Body(
          idProduct: idProduct,
          premisId: premisId,
        )),
        bottomNavigationBar: _BottomNavigationBar(
          premisId: premisId,
          productId: idProduct,
          saleType: saleType,
        ),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  final String? idProduct;
  final String? premisId;

  const _Body({this.idProduct, this.premisId, Key? key}) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  void initState() {
    final state = context.read<HaddadMallState>();

    context.read<SettingState>().getQuantityButton();
    context.read<SettingState>().getAddToCartButton();
    context.read<SettingState>().getAndroidVersion();
    context.read<SettingState>().getIOSVersion();
    // state.getAllList(widget.idProduct!, widget.premisId!);
    // state.getAll(widget.idProduct!, widget.premisId!);
    state.getAllListBaru(widget.idProduct!, widget.premisId!);
    state.getSetting();
    state.version();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingState>(
      builder: (_, settingState, __) {
        return Consumer<HaddadMallState>(
          builder: (_, state, __) {
            return state.isLoading ||
                    settingState.isLoading ||
                    settingState.quantityButton == null
                ? AppLoadingOverlay()
                : Column(
                    children: [
                      _ProductImage(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(18, 20, 18, 0),
                        child: Column(
                          children: [
                            _Price(),
                            _Description(),
                            _Tags(),
                          ],
                        ),
                      ),
                      Platform.isAndroid
                          ? settingState.androidVersion![0].value ==
                                  state.androidVersion
                              ? settingState.quantityButton![0].value2! == '0'
                                  ? Container()
                                  : settingState.quantityButton![0].value! ==
                                          '0'
                                      ? Container()
                                      : _Quantity()
                              : _Quantity()
                          : settingState.iosVersion![0].value ==
                                  state.iOSVersion
                              ? settingState.quantityButton![0].value3! == '0'
                                  ? Container()
                                  : settingState.quantityButton![0].value! ==
                                          '0'
                                      ? Container()
                                      : _Quantity()
                              : _Quantity()
                    ],
                  );
          },
        );
      },
    );
  }
}

class _ProductImage extends StatelessWidget {
  const _ProductImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HaddadMallState>(
      builder: (_, state, __) {
        return state.isLoading
            ? AppLoadingOverlay()
            : Container(
                height: AppSize.heightScreen(context) * 0.4,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(
                      imageURl + state.singleProductList![0].image!),
                )),
              );
      },
    );
  }
}

class _Price extends StatelessWidget {
  const _Price({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HaddadMallState>(
      builder: (_, state, __) {
        return state.isLoading
            ? AppLoadingOverlay()
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: AppSize.mainSpaceBetween,
                    children: [
                      TextManrope(
                        text: 'RM${state.singleProductList![0].harga!}',
                        textAlign: TextAlign.left,
                        color: primaryColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      TextManrope(
                        text:
                            'Stock: ${state.singleProductList![0].quantity} left',
                        color: dangerColor,
                        fontSize: 12,
                      )
                    ],
                  ),
                  SizedBox(
                    height: AppSize.heightScreen(context) * 0.02,
                  ),
                ],
              );
      },
    );
  }
}

class _Quantity extends StatefulWidget {
  const _Quantity({Key? key}) : super(key: key);

  @override
  State<_Quantity> createState() => _QuantityState();
}

class _QuantityState extends State<_Quantity> {
  @override
  void initState() {
    super.initState();
    // state.price = double.parse(state.singleProductList![0].harga!);
    // print('harga sini ${state.price}');
    // SchedulerBinding.instance.addPostFrameCallback((_) {
    //
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HaddadMallState>(
      builder: (_, state, __) {
        return state.isLoading
            ? AppLoadingOverlay()
            : Column(
                children: [
                  TextManrope(
                    text: 'RM${state.price.toString()}0',
                    fontSize: 20,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: AppSize.mainCenter,
                    children: [
                      InkWell(
                        onTap: () {
                          if (state.quantity > 1) {
                            state.quantity--;
                          }
                        },
                        child: Container(
                            width: AppSize.widthScreen(context) * 0.15,
                            height: AppSize.heightScreen(context) * 0.06,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                              color: primaryColor,
                            ),
                            child: Center(
                                child: Icon(
                              Icons.remove,
                            ))),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Container(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 250),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return ScaleTransition(
                                child: child, scale: animation);
                          },
                          child: Text(
                            state.quantity.toString(),
                            style: TextStyle(color: Colors.black),
                            // key: ValueKey<int>(_count),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      InkWell(
                        onTap: () {
                          state.quantity++;
                        },
                        child: Container(
                            width: AppSize.widthScreen(context) * 0.15,
                            height: AppSize.heightScreen(context) * 0.06,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              color: primaryColor,
                            ),
                            child: Center(
                                child: Icon(
                              Icons.add,
                            ))),
                      ),
                    ],
                  ),
                ],
              );
      },
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HaddadMallState>(
      builder: (_, state, __) {
        return state.isLoading
            ? AppLoadingOverlay()
            : Column(
                crossAxisAlignment: AppSize.crossStart,
                children: [
                  SizedBox(
                    width: AppSize.widthScreen(context),
                    child: TextManrope(
                      text:
                          'Description:\n${state.singleProductList![0].description!}',
                      maxLines: 10,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: AppSize.heightScreen(context) * 0.01,
                  ),
                ],
              );
      },
    );
  }
}

class _Tags extends StatelessWidget {
  const _Tags({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HaddadMallState>(
      builder: (_, state, __) {
        return state.isLoading
            ? AppLoadingOverlay()
            : Column(
                children: [
                  Row(
                    children: [
                      TextManrope(
                        text: 'tags: ${state.singleProductList![0].tagproduk}',
                        color: grayColor,
                        fontSize: 12,
                        maxLines: 3,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppSize.heightScreen(context) * 0.02,
                  ),
                ],
              );
      },
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  final String? premisId;
  final String? productId;
  final String? saleType;

  const _BottomNavigationBar(
      {this.premisId, this.productId, this.saleType, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _AddToCart(
          premisId: premisId!,
          productId: productId,
          saleType: saleType,
        ),
        // _BuyNow(
        //   premisId: premisId!,
        //   productId: productId,
        // ),
      ],
    );
  }
}

class _AddToCart extends StatelessWidget {
  final String? premisId;
  final String? productId;
  final String? saleType;

  const _AddToCart({this.premisId, this.productId, this.saleType, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingState>(
      builder: (_, settingState, __) {
        return Consumer<HaddadMallState>(
          builder: (_, state, __) {
            return state.isLoading && settingState.isLoading
                ? AppLoadingOverlay()
                : Platform.isAndroid
                    ? settingState.androidVersion![0].value ==
                            state.androidVersion
                        ? settingState.addToCartButton![0].value2! == '0'
                            ? Container(
                                height: 0,
                              )
                            : settingState.addToCartButton![0].value! == '0'
                                ? Container(
                                    height: 0,
                                  )
                                : InkWell(
                                    onTap: () {
                                      // cek kalau user dah ada dalam table order, kalau tak dak lagi post dulu ke table order.
                                      // state.firstCheck(context, premisId!,
                                      //     productId!, saleType!);

                                      // try baru
                                      state.firstCheckListBaru(context,
                                          premisId!, productId!, saleType!);

                                      // try
                                      // state.firstCheckList(context, premisId!,
                                      //     productId!, saleType!);
                                    },
                                    child: Container(
                                      width: AppSize.widthScreen(context),
                                      height:
                                          AppSize.heightScreen(context) * 0.07,
                                      color: secondaryColor,
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            0,
                                            AppSize.heightScreen(context) *
                                                0.02,
                                            0,
                                            0),
                                        child: TextManrope(
                                          text: 'ADD TO CART',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                        : InkWell(
                            onTap: () {
                              // cek kalau user dah ada dalam table order, kalau tak dak lagi post dulu ke table order.
                              // state.firstCheck(
                              //     context, premisId!, productId!, saleType!);

                              state.firstCheckListBaru(
                                  context, premisId!, productId!, saleType!);
                            },
                            child: Container(
                              width: AppSize.widthScreen(context),
                              height: AppSize.heightScreen(context) * 0.07,
                              color: secondaryColor,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0,
                                    AppSize.heightScreen(context) * 0.02, 0, 0),
                                child: TextManrope(
                                  text: 'ADD TO CART',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                    : settingState.iosVersion![0].value == state.iOSVersion
                        ? settingState.addToCartButton![0].value3! == '0'
                            ? Container(
                                height: 0,
                              )
                            : settingState.addToCartButton![0].value! == '0'
                                ? Container(
                                    height: 0,
                                  )
                                : InkWell(
                                    onTap: () {
                                      // cek kalau user dah ada dalam table order, kalau tak dak lagi post dulu ke table order.
                                      // state.firstCheck(context, premisId!,
                                      //     productId!, saleType!);

                                      state.firstCheckListBaru(context,
                                          premisId!, productId!, saleType!);
                                    },
                                    child: Container(
                                      width: AppSize.widthScreen(context),
                                      height:
                                          AppSize.heightScreen(context) * 0.07,
                                      color: secondaryColor,
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            0,
                                            AppSize.heightScreen(context) *
                                                0.02,
                                            0,
                                            0),
                                        child: TextManrope(
                                          text: 'ADD TO CART',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                        : InkWell(
                            onTap: () {
                              // cek kalau user dah ada dalam table order, kalau tak dak lagi post dulu ke table order.
                              // state.firstCheck(
                              //     context, premisId!, productId!, saleType!);

                              state.firstCheckListBaru(
                                  context, premisId!, productId!, saleType!);
                            },
                            child: Container(
                              width: AppSize.widthScreen(context),
                              height: AppSize.heightScreen(context) * 0.07,
                              color: secondaryColor,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0,
                                    AppSize.heightScreen(context) * 0.02, 0, 0),
                                child: TextManrope(
                                  text: 'ADD TO CART',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
          },
        );
      },
    );
  }
}

// class _AddToCart extends StatelessWidget {
//   final String? premisId;
//   final String? productId;
//
//   const _AddToCart({this.premisId, this.productId, Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<SettingState>(
//       builder: (_, settingState, __) {
//         return Consumer<HaddadMallState>(
//           builder: (_, state, __) {
//             return state.isLoading && settingState.isLoading
//                 ? AppLoadingOverlay()
//                 : settingState.addToCartButton![0].value == '0'
//                     ? Container(
//                         height: 0,
//                       )
//                     : InkWell(
//                         onTap: () {
//                           // cek kalau user dah ada dalam table order, kalau tak dak lagi post dulu ke table order.
//                           state.firstCheck(context, premisId!, productId!);
//                         },
//                         child: Container(
//                           width: AppSize.widthScreen(context),
//                           height: AppSize.heightScreen(context) * 0.07,
//                           color: secondaryColor,
//                           child: Padding(
//                             padding: EdgeInsets.fromLTRB(
//                                 0, AppSize.heightScreen(context) * 0.02, 0, 0),
//                             child: TextManrope(
//                               text: 'ADD TO CART',
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       );
//           },
//         );
//       },
//     );
//   }
// }

// class _BuyNow extends StatelessWidget {
//   final String? premisId;
//   final String? productId;
//
//   const _BuyNow({Key? key, this.premisId, this.productId}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<HaddadMallState>(
//       builder: (_, state, __) {
//         return InkWell(
//           onTap: () async {
//             await state.payNow(context, premisId!, productId!);
//             AppRoute.push(context, ConfirmProductPage());
//           },
//           child: Container(
//             width: AppSize.widthScreen(context) / 2,
//             height: AppSize.heightScreen(context) * 0.07,
//             color: primaryColor,
//             child: Padding(
//               padding: EdgeInsets.fromLTRB(
//                   0, AppSize.heightScreen(context) * 0.02, 0, 0),
//               child: TextManrope(
//                 text: 'BUY NOW',
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

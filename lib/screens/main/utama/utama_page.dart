import 'package:apps_al_haddad/providers/utama/utama_state.dart';
import 'package:flutter/material.dart';

import 'package:apps_al_haddad/al_haddad.dart';
import 'package:url_launcher/url_launcher.dart';

class UtamaPage extends StatelessWidget {
  const UtamaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => UtamaState(),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          bottom: 16.0,
          top: 8.0,
        ),
        child: _Body(),
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
  @override
  void initState() {
    super.initState();
    final state = context.read<UtamaState>();

    state.getOrderIdMall();
    state.getAllUserPoints();
    state.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UtamaState>(
      builder: (_, state, __) {
        return state.isLoading
            ? AppLoadingOverlay()
            : Column(
                children: [
                  _SubMenuList(),
                  _KeyHighlights(),
                  _Promotion(),
                  _ProductList1(),
                  // _AlHaddadCorner(),
                  // _SizedBox30(),
                  // _ProductList2(),
                ],
              );
      },
    );
  }
}

class _ProductList1 extends StatelessWidget {
  const _ProductList1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          TextManrope(text: 'Product Category'),
          // _ViewAllButton(onTap: () => {})
        ]),
        SizedBox(
          height: 10,
        ),
        _ProductListItems(),
      ],
    );
  }
}

class _ProductListItems extends StatelessWidget {
  const _ProductListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UtamaState>(
      builder: (_, state, __) {
        return state.productCategory == null
            ? Container()
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                        state.productCategory!.length,
                        (i) => Row(
                              children: [
                                ProductCard(
                                    title: state.productCategory![i].text!,
                                    image: state.productCategory![i].image!,
                                    onTap: () => {
                                          AppRoute.push(
                                              context,
                                              ProductByCategoryPage(
                                                categoryName: state
                                                    .productCategory![i].text!,
                                                categoryId: state
                                                    .productCategory![i]
                                                    .kategoriProduk,
                                              ))
                                        }),
                                SizedBox(
                                  width: 10,
                                )
                              ],
                            ))
                  ],
                ),
              );
      },
    );
  }
}

class _SubMenuList extends StatelessWidget {
  const _SubMenuList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UtamaState>(
      builder: (_, state, __) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 4.0,
          child: Column(
            mainAxisAlignment: AppSize.mainStart,
            children: [
              ...List.generate(
                  1,
                  (index) => SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: AppSize.mainStart,
                          crossAxisAlignment: AppSize.crossStart,
                          children: [
                            FastAppIcons(
                                label: 'Al Haddad Mall',
                                image: 'assets/images/Alhaddad_Marketing_2.png',
                                onPressed: () async {
                                  if (state.orderIdMall != null) {
                                    AppModal.showInformation(
                                        context,
                                        "Alert",
                                        "You are choosing online order. \n"
                                            "Your item(s) in cart will be deleted. Are you sure to proceed?",
                                        btnTitle: 'Yes', onTap: () async {
                                      await state.deleteOrder(context);
                                    });
                                  } else if (state.orderIdMall == null) {
                                    AppRoute.push(context, ChoosePremisPage());
                                  }
                                }),
                            SizedBox(
                              width: 8,
                            ),
                            FastAppIcons(
                                label: 'Mart',
                                image: 'assets/images/Alhaddad_Marketing.png',
                                onPressed: () =>
                                    AppRoute.push(context, MartsjidPage())),
                            SizedBox(
                              width: 8,
                            ),
                            FastAppIcons(
                                label: 'Lokasi Stokis',
                                image:
                                    'assets/images/Alhaddad_Lokasi_Stokis.png',
                                onPressed: () => {
                                      AppRoute.push(
                                          context, StokisTerdekatpage())
                                    }),
                            SizedBox(
                              width: 8,
                            ),
                            FastAppIcons(
                                label: 'Jejak Parcel',
                                image:
                                    'assets/images/Alhaddad_Jejak_Parcel.png',
                                onPressed: () {
                                  AppRoute.push(context, JejakParcelPage());
                                }),
                            SizedBox(
                              width: 8,
                            ),
                            FastAppIcons(
                                label: 'Wadi Al Haddad',
                                image: 'assets/images/alhaddad_wadi_cs.png',
                                onPressed: () => {
                                      // AppRoute.push(context, ProdukMasjidPage())
                                      showDialog(
                                        context: context,
                                        builder: (_) {
                                          return Material(
                                            color: Colors.transparent,
                                            child: AppAlertDialog(
                                              alertDialogType:
                                                  AlertDialogType.info,
                                              title: "Ops, sorry",
                                              subtitle: '',
                                              description:
                                                  "Currently not available",
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
                                      )
                                    }),
                            SizedBox(
                              width: 8,
                            ),
                            FastAppIcons(
                                label: 'Al Haddad Maritime',
                                image: 'assets/images/alhaddad_maritime_cs.png',
                                onPressed: () => {
                                      showDialog(
                                        context: context,
                                        builder: (_) {
                                          return Material(
                                            color: Colors.transparent,
                                            child: AppAlertDialog(
                                              alertDialogType:
                                                  AlertDialogType.info,
                                              title: "Ops, sorry",
                                              subtitle: '',
                                              description:
                                                  "Currently not available",
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
                                      )
                                    }),
                            SizedBox(
                              width: 8,
                            ),
                            FastAppIcons(
                                label: 'Al Haddad Farm Village',
                                image: 'assets/images/alhaddad_farm_cs.png',
                                onPressed: () => {
                                      // AppRoute.push(context, KomunitiMasjidPage())
                                      showDialog(
                                        context: context,
                                        builder: (_) {
                                          return Material(
                                            color: Colors.transparent,
                                            child: AppAlertDialog(
                                              alertDialogType:
                                                  AlertDialogType.info,
                                              title: "Ops, sorry",
                                              subtitle: '',
                                              description:
                                                  "Currently not available",
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
                                      )
                                    }),
                            SizedBox(
                              width: 8,
                            ),
                            FastAppIcons(
                                label: 'Attendance',
                                image: 'assets/images/Alhaddad_Farm.png',
                                onPressed: () => AppRoute.push(
                                    context, AttendanceScanPage())),
                          ],
                        ),
                      ))
            ],
          ),
        );
      },
    );
  }
}

class _KeyHighlights extends StatelessWidget {
  const _KeyHighlights({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UtamaState>(
      builder: (_, state, __) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: AppSize.mainSpaceBetween,
              children: [
                _TitleText(label: 'Key Highlights'),
                state.bearerToken != null ? _HibahPoints() : Container(),
              ],
            ),
            const SizedBox(height: 16.0),
            _KeyHighlightSlider(),
          ],
        );
      },
    );
  }
}

class _HibahPoints extends StatelessWidget {
  const _HibahPoints({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UtamaState>(
      builder: (_, state, __) {
        return InkWell(
          onTap: () {
            AppRoute.push(context, PointsPage());
          },
          child: Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: AppSize.crossStart,
                children: [
                  TextManrope(
                      text: 'Total Hibah: ${state.totalHibah![0].point}'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Promotion extends StatelessWidget {
  const _Promotion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16.0),
        const _TitleText(label: 'Promotion'),
        const SizedBox(height: 16.0),
        _PromotionSlider(),
      ],
    );
  }
}

class _TitleText extends StatelessWidget {
  final String label;

  const _TitleText({
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        color: darkColor,
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
    );
  }
}

class _KeyHighlightSlider extends StatefulWidget {
  _KeyHighlightSlider({Key? key}) : super(key: key);

  @override
  State<_KeyHighlightSlider> createState() => _KeyHighlightSliderState();
}

class _KeyHighlightSliderState extends State<_KeyHighlightSlider> {
  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    final _carouselController = CarouselController();
    return Consumer<UtamaState>(builder: (_, state, __) {
      return state.sliderList == null
          ? AppLoadingOverlay()
          : Column(
              children: [
                CarouselSlider.builder(
                    carouselController: carouselController,
                    options: CarouselOptions(
                        height: 200.0,
                        initialPage: state.currentNews,
                        disableCenter: true,
                        pageSnapping: false,
                        viewportFraction: 1.0,
                        enlargeCenterPage: false,
                        enableInfiniteScroll: false,
                        autoPlay: true,
                        onPageChanged: (index, _) {
                          setState(() {
                            state.currentNews = index;
                          });
                        }),
                    itemCount: state.sliderList!.length,
                    itemBuilder: (_, i, __) {
                      return InteractiveViewer(
                        // boundaryMargin: const EdgeInsets.all(20.0),
                        minScale: 0.1,
                        maxScale: 3.0,
                        panEnabled: true,
                        child: InkWell(
                          onTap: () {
                            launchUrl(Uri.parse(state.sliderList![i].url!));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  "${imageURl + state.sliderList![i].image!}",
                                ),
                              ),
                              color: grayColor,
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
                        ),
                      );
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: state.sliderList!.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _carouselController.animateToPage(entry.key),
                      child: Container(
                        width: 10.0,
                        height: 10.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: state.currentNews == entry.key
                                ? secondaryColor
                                : secondaryColor.withOpacity(0.5)),
                      ),
                    );
                  }).toList(),
                ),
              ],
            );
    });
  }
}

class _PromotionSlider extends StatefulWidget {
  _PromotionSlider({Key? key}) : super(key: key);

  @override
  State<_PromotionSlider> createState() => _PromotionSliderState();
}

class _PromotionSliderState extends State<_PromotionSlider> {
  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    final _carouselController = CarouselController();
    return Consumer<UtamaState>(builder: (_, state, __) {
      return state.promotionList == null
          ? AppLoadingOverlay()
          : Column(
              children: [
                CarouselSlider.builder(
                    carouselController: carouselController,
                    options: CarouselOptions(
                        height: 200.0,
                        initialPage: state.promotion,
                        disableCenter: true,
                        pageSnapping: false,
                        viewportFraction: 1.0,
                        enlargeCenterPage: false,
                        enableInfiniteScroll: false,
                        autoPlay: true,
                        onPageChanged: (index, _) {
                          setState(() {
                            state.promotion = index;
                          });
                        }),
                    itemCount: state.promotionList!.length,
                    itemBuilder: (_, i, __) {
                      return InteractiveViewer(
                        // boundaryMargin: const EdgeInsets.all(20.0),
                        minScale: 0.1,
                        maxScale: 3.0,
                        panEnabled: true,
                        child: InkWell(
                          onTap: () {
                            launchUrl(Uri.parse(state.promotionList![i].url!));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  "${imageURl + state.promotionList![i].image!}",
                                ),
                              ),
                              color: grayColor,
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
                        ),
                      );
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: state.promotionList!.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _carouselController.animateToPage(entry.key),
                      child: Container(
                        width: 10.0,
                        height: 10.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: state.promotion == entry.key
                                ? secondaryColor
                                : secondaryColor.withOpacity(0.5)),
                      ),
                    );
                  }).toList(),
                ),
              ],
            );
    });
  }
}

class _SizedBoxWidth30 extends StatelessWidget {
  const _SizedBoxWidth30({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
    );
  }
}

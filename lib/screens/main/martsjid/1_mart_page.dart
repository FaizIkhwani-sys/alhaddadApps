import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';

class MartsjidPage extends StatelessWidget {
  const MartsjidPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => MartState(),
      child: AppSecondaryBar(
        title: 'Mart',
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(child: _Body()),
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
    final state = context.read<MartState>();

    state.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _ProductList();
  }
}

class _ProductList extends StatelessWidget {
  const _ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MartState>(
      builder: (_, state, __) {
        return state.isLoading
            ? AppLoadingOverlay()
            : state.productsList == null
                ? SizedBox(
                    height: AppSize.heightScreen(context) * 0.85,
                    child: Center(
                        child:
                            TextManrope(text: 'Sorry, No Products Available')))
                : GridView.count(
                    shrinkWrap: true,
                    primary: false,
                    padding: const EdgeInsets.all(10),
                    // crossAxisSpacing: 4,
                    // mainAxisSpacing: 4,
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    children: [
                      ...List.generate(
                        state.productsList!.length,
                        (i) => _MenuCard(
                          onTap: () {
                            AppRoute.push(
                                context,
                                SingleProductPage(
                                  productName: state.productsList![i].name!,
                                  idProduct: state.productsList![i].productsId,
                                  premisId: state.productsList![i].premisId,
                                  saleType: '456',
                                ));
                          },
                          title: state.productsList![i].name!,
                          image: imageURl + state.productsList![i].image!,
                          price: state.productsList![i].harga,
                          stock: state.productsList![i].quantity,
                        ),
                      )
                    ],
                  );
      },
    );
  }
}

class _MenuCard extends StatelessWidget {
  final String? image;
  final String? title;
  final Function() onTap;
  final String? price;
  final String? stock;

  const _MenuCard(
      {this.image,
      this.title,
      required this.onTap,
      this.price,
      this.stock,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 12.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: AppSize.mainSpaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: AppSize.heightScreen(context) * 0.15,
                  decoration: BoxDecoration(
                      // shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(image!), fit: BoxFit.cover)),
                ),
              ),
              TextManrope(
                text: title!,
                fontSize: 12,
                textAlign: TextAlign.start,
                maxLines: 3,
              ),
              Row(
                mainAxisAlignment: AppSize.mainSpaceBetween,
                children: [
                  TextManrope(
                    text: 'RM$price',
                    color: primaryColor,
                  ),
                  TextManrope(
                    text: '$stock left',
                    color: dangerColor,
                    fontSize: 11,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class HaddadMallPage extends StatelessWidget {
//   const HaddadMallPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return AppWebViewPage(
//       hasBackButton: true,
//       appBarTitle: 'Al-Haddad Mall',
//       url: getUrlMallMuslim(),
//     );
//   }
// }
//
// String getUrlMallMuslim() {
//   String url =
//       '${BASE_URL_CUSTOMAPP}mall.php';
//
//   return url;
// }

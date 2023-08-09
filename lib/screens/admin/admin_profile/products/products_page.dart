import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AdminProfileState(),
      child: AppSecondaryBar(
        title: 'Products',
        body: SingleChildScrollView(child: _Body()),
        backgroundColor: backgroundColor,
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

    final state = context.read<AdminProfileState>();

    state.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<AdminProfileState>(
        builder: (_, state, __) {
          return state.isLoading
              ? AppLoadingOverlay()
              : Column(
                  children: [
                    _ProdukTerlaris(),
                    _Stock(),
                  ],
                );
        },
      ),
    );
  }
}

class _ProdukTerlaris extends StatelessWidget {
  const _ProdukTerlaris({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminProfileState>(
      builder: (_, state, __) {
        return Column(
          children: [
            _Title(
              title: 'Top Products',
              onTap: () {
                AppRoute.push(context, TopProductsPage());
              },
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                      state.terlarisLimit!.length,
                      (i) => _ProductCard(
                            image: state.terlarisLimit![i].image,
                            productName: state.terlarisLimit![i].name,
                          )),
                ],
              ),
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

class _Stock extends StatelessWidget {
  const _Stock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminProfileState>(
      builder: (_, state, __) {
        return Column(
          children: [
            _Title(
              title: 'Stock',
              onTap: () {
                AppRoute.push(context, StockPage());
              },
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                      state.stockLimit!.length,
                      (i) => _ProductCard(
                            image: state.stockLimit![i].image,
                            productName: state.stockLimit![i].name,
                          )),
                ],
              ),
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

class _ProductCard extends StatelessWidget {
  final String? image;
  final String? productName;

  const _ProductCard({this.image, this.productName, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              height: AppSize.heightScreen(context) * 0.18,
              width: AppSize.widthScreen(context) * 0.3,
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0)),
                  image: DecorationImage(
                      image: NetworkImage(imageURl + image!),
                      fit: BoxFit.fill)),
            ),
            Container(
              width: AppSize.widthScreen(context) * 0.3,
              height: AppSize.heightScreen(context) * 0.1,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: TextManrope(
                  text: productName!.capitalizeFirstofEach,
                  fontSize: 12,
                  maxLines: 5,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final Function()? onTap;

  const _Title({this.title, this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: AppSize.mainSpaceBetween,
      children: [
        TextManrope(
          text: title!,
          fontWeight: FontWeight.bold,
        ),
        InkWell(onTap: onTap, child: TextManrope(text: 'See More')),
      ],
    );
  }
}

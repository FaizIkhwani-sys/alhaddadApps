import 'package:apps_al_haddad/providers/utama/utama_state.dart';
import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductByCategoryPage extends StatelessWidget {
  final String? categoryName;
  final String? categoryId;

  const ProductByCategoryPage({this.categoryName, this.categoryId, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UtamaState(),
      child: AppSecondaryBar(
          title: categoryName,
          body: SingleChildScrollView(
              child: _Body(
            categoryId: categoryId,
          ))),
    );
  }
}

class _Body extends StatefulWidget {
  final String? categoryId;

  const _Body({this.categoryId, Key? key}) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  void initState() {
    super.initState();
    final state = context.read<UtamaState>();

    state.getProductByCategory(widget.categoryId!);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UtamaState>(
      builder: (_, state, __) {
        return state.isLoading
            ? AppLoadingOverlay()
            : state.productByCategoryList == null
                ? TextManrope(text: 'No Product')
                : GridView.count(
                    shrinkWrap: true,
                    primary: false,
                    padding: const EdgeInsets.all(10),
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    children: [
                      ...List.generate(
                        state.productByCategoryList!.length,
                        (i) => ProductCard(
                            title: state.productByCategoryList![i].name!,
                            image: state.productByCategoryList![i].image!,
                            onTap: () => {}),
                      )
                    ],
                  );
        ;
      },
    );
  }
}

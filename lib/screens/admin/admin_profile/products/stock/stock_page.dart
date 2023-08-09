import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

late FocusNode _searchNode;

class StockPage extends StatelessWidget {
  const StockPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AdminProfileState(),
      child: AppSecondaryBar(
        title: 'Stocks',
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

    state.getStockAll('');
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminProfileState>(
      builder: (_, state, __) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _SearchField(),
              state.isLoading
                  ? AppLoadingOverlay()
                  : state.stockAll == null
                      ? TextManrope(text: 'Sorry, no search result')
                      : _StockAllProducts(),
            ],
          ),
        );
      },
    );
  }
}

class _SearchField extends StatefulWidget {
  const _SearchField({Key? key}) : super(key: key);

  @override
  State<_SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<_SearchField> {
  @override
  void initState() {
    super.initState();
    _searchNode = FocusNode();
  }

  @override
  void dispose() {
    _searchNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminProfileState>(
      builder: (_, state, __) {
        return AppTextFieldWithLabel(
          focusNode: _searchNode,
          hint: "search product...",
          keyboardType: TextInputType.text,
          onChange: (v) => state.searchStock = v,
          onSubmitted: (v) => state.searchStock = v,
        );
      },
    );
  }
}

class _StockAllProducts extends StatelessWidget {
  const _StockAllProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminProfileState>(
      builder: (_, state, __) {
        return GridView.builder(
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: state.stockAll!.length,
          itemBuilder: (BuildContext context, int i) {
            return _StockCard(
              image: state.stockAll![i].image,
              productName: state.stockAll![i].name,
              stock:
                  state.stockAll![i].baki == '' ? '0' : state.stockAll![i].baki,
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              childAspectRatio: 0.7,
              mainAxisSpacing: 8),
          padding: const EdgeInsets.all(10),
        );
      },
    );
  }
}

class _StockCard extends StatelessWidget {
  final String? image;
  final String? productName;
  final String? stock;

  const _StockCard({this.image, this.productName, this.stock, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: AppSize.heightScreen(context) * 0.2,
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0)),
              image: DecorationImage(
                  image: NetworkImage(imageURl + image!), fit: BoxFit.fill)),
        ),
        Expanded(
          child: Container(
            width: AppSize.widthScreen(context),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  TextManrope(
                    text: productName!,
                    maxLines: 3,
                  ),
                  Expanded(
                    child: TextManrope(
                      text: 'Stock: ${stock!}',
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

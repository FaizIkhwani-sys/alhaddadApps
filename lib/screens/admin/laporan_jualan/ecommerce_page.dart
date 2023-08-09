import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

late FocusNode _searchNode;

class EcommercePage extends StatelessWidget {
  const EcommercePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LaporanJualanState(),
      child: Consumer<LaporanJualanState>(
        builder: (_, state, __) {
          return AppSecondaryBar(
            title: 'E-Commerce',
            body: SingleChildScrollView(child: _Body()),
            backgroundColor: backgroundColor,
            actions: [
              InkWell(
                onTap: () {
                  state.isClicked = !state.isClicked;
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          );
        },
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
    final state = context.read<LaporanJualanState>();

    state.getEcommerce('');
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LaporanJualanState>(
      builder: (_, state, __) {
        return _Content();
      },
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LaporanJualanState>(
      builder: (_, state, __) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(6, 8, 6, 8),
          child: Column(
            children: [
              state.isClicked ? _SearchField() : Container(),
              state.isLoading
                  ? AppLoadingOverlay()
                  : state.ecommerceList == null
                      ? Center(child: TextManrope(text: 'No search result'))
                      : GridView.builder(
                          physics: ScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: state.ecommerceList!.length,
                          itemBuilder: (BuildContext context, int i) {
                            return _EcommerceCard(
                              premisName: state.ecommerceList![i].namaPremis,
                              imageUrl: state.ecommerceList![i].image,
                              productName: state.ecommerceList![i].name,
                              price: state.ecommerceList![i].harga,
                              total: state.ecommerceList![i].onl,
                              quantity: state.ecommerceList![i].qty,
                            );
                          },
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 8,
                            childAspectRatio: 0.45,
                          ),
                          padding: const EdgeInsets.all(10),
                        ),
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
    return Consumer<LaporanJualanState>(
      builder: (_, state, __) {
        return AppTextFieldWithLabel(
          focusNode: _searchNode,
          hint: "search product...",
          keyboardType: TextInputType.text,
          onChange: (v) => state.search = v,
          onSubmitted: (v) => state.search = v,
        );
      },
    );
  }
}

class _EcommerceCard extends StatelessWidget {
  final String? premisName;
  final String? imageUrl;
  final String? productName;
  final String? price;
  final String? total;
  final String? quantity;

  const _EcommerceCard(
      {this.premisName,
      this.imageUrl,
      this.productName,
      this.price,
      this.total,
      this.quantity,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: primaryColor,
      ),
      child: Column(
        children: [
          Image.network(imageURl + imageUrl!),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: AppSize.crossStart,
              children: [
                TextManrope(
                  text: productName!,
                  maxLines: 3,
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.bold,
                ),
                TextManrope(
                  text: 'Retailer: $premisName',
                  maxLines: 3,
                  textAlign: TextAlign.left,
                ),
                TextManrope(
                  text: 'Price/unit: RM$price',
                  maxLines: 3,
                  textAlign: TextAlign.left,
                ),
                TextManrope(
                  text: 'Quantity Sold: $quantity',
                  maxLines: 3,
                  textAlign: TextAlign.left,
                ),
                TextManrope(
                  text: 'Total: RM$total',
                  maxLines: 3,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

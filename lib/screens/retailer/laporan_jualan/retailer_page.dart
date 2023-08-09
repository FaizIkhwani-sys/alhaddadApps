import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RetailerPage extends StatelessWidget {
  const RetailerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LaporanJualanState(),
      child: AppSecondaryBar(
        title: 'Retailer',
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
    final state = context.read<LaporanJualanState>();

    state.getRetailer();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LaporanJualanState>(
      builder: (_, state, __) {
        return state.isLoading
            ? AppLoadingOverlay()
            : Padding(
                padding: const EdgeInsets.fromLTRB(6, 8, 6, 8),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: state.retailList!.length,
                  itemBuilder: (BuildContext context, int i) {
                    return _RetailerReportCard(
                      retailerName: state.retailList![i].namaPremis,
                      online: state.retailList![i].onl,
                      pos: state.retailList![i].pos,
                      internalSale: state.retailList![i].internal,
                      stockReturn: state.retailList![i].reject,
                      productActivation: state.retailList![i].activation,
                      offline: state.retailList![i].offl,
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.65,
                  ),
                  padding: const EdgeInsets.all(10),
                ),
              );
      },
    );
  }
}

class _RetailerReportCard extends StatelessWidget {
  final String? retailerName;
  final String? online;
  final String? pos;
  final String? internalSale;
  final String? stockReturn;
  final String? productActivation;
  final String? offline;

  const _RetailerReportCard(
      {this.retailerName,
      this.online,
      this.pos,
      this.internalSale,
      this.stockReturn,
      this.productActivation,
      this.offline,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextManrope(
              text: retailerName!,
              fontWeight: FontWeight.bold,
              maxLines: 2,
            ),
            SizedBox(
              height: 4,
            ),
            Column(
              crossAxisAlignment: AppSize.crossStart,
              children: [
                TextManrope(
                  text: 'Online: RM${online!}',
                  textAlign: TextAlign.left,
                  maxLines: 2,
                ),
                TextManrope(
                  text: 'POS: RM${pos!}',
                  textAlign: TextAlign.left,
                  maxLines: 2,
                ),
                TextManrope(
                  text: 'Internal Sale: RM${internalSale!}',
                  textAlign: TextAlign.left,
                  maxLines: 2,
                ),
                TextManrope(
                  text: 'Stock Return: RM${stockReturn!}',
                  textAlign: TextAlign.left,
                  maxLines: 2,
                ),
                TextManrope(
                  text: 'Product Activation: RM${productActivation!}',
                  textAlign: TextAlign.left,
                  maxLines: 2,
                ),
                TextManrope(
                  text: 'Offline: RM${offline!}',
                  textAlign: TextAlign.left,
                  maxLines: 2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:apps_al_haddad/al_haddad.dart';
import 'package:flutter/material.dart';

class TransactionSubPage extends StatelessWidget {
  final String orderId;

  const TransactionSubPage({required this.orderId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppSecondaryBar(
      backgroundColor: backgroundColor,
      title: "Purchase History",
      body: ChangeNotifierProvider(
        create: (_) => TransactionState(),
        child: _Body(
          orderId: orderId,
        ),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  final String orderId;

  const _Body({required this.orderId, Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  void initState() {
    super.initState();

    final state = context.read<TransactionState>();

    state.getOrderDetails(widget.orderId);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionState>(
      builder: (_, state, __) {
        return state.isLoading
            ? AppLoadingOverlay()
            : Column(
                children: [
                  _AppTitleCard(),
                  SizedBox(
                    height: 10,
                  ),
                  _ListItem(),
                ],
              );
      },
    );
  }
}

class _ListItem extends StatefulWidget {
  const _ListItem({Key? key}) : super(key: key);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<_ListItem> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionState>(builder: (_, state, __) {
      return Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(8.0),
              itemCount: state.orderDetails!.length,
              itemBuilder: (_, index) {
                return Column(
                  children: [
                    AppReceiptCard(
                      index: index + 1,
                      itemName: state.orderDetails![index].name!,
                      quantity: state.orderDetails![index].kuantiti!,
                      price: 10000.00,
                    ),
                    SizedBox(
                      height: 10.0,
                    )
                  ],
                );
              }),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              thickness: 1.0,
              color: Colors.black,
            ),
          ),
        ],
      );
    });
  }
}

class _AppTitleCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: AppSize.widthScreen(context),
      child: Row(
        mainAxisAlignment: AppSize.mainSpaceEvenly,
        children: [
          Container(
            color: Colors.black,
            width: AppSize.widthScreen(context) * 0.45,
            child: Text(
              "Item",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            color: Colors.black,
            width: AppSize.widthScreen(context) * 0.2,
            child: Text(
              "Quantity",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

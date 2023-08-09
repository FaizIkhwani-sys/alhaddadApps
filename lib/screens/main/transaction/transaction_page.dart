import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:intl/intl.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => TransactionState(),
      child: _Body(),
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

    final state = context.read<TransactionState>();

    state.getTransaction();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionState>(
      builder: (_, state, __) {
        return state.isLoading
            ? AppLoadingOverlay()
            : state.transaction == null
                ? Center(child: TextManrope(text: "No Transaction"))
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ...List.generate(
                              state.transaction!.length,
                              (index) => AppTransactionCard(
                                    id: state.transaction![index].id!,
                                    total:
                                        'RM${state.transaction![index].grandTotal!}',
                                    dateTime:
                                        '${DateFormat('dd-MM-yyyy').format(DateTime.parse(state.transaction![0].updateAt!))}',
                                    onTap: () => AppRoute.push(
                                        context,
                                        TransactionSubPage(
                                            orderId:
                                                state.transaction![index].id!)),
                                  )),
                        ],
                      ),
                    ),
                  );
      },
    );
  }
}

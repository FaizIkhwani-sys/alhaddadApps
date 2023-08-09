import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';

class ChoosePremisPage extends StatelessWidget {
  const ChoosePremisPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HaddadMallState(),
      child: AppSecondaryBar(
        title: 'Premis',
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
    super.initState();

    final state = context.read<HaddadMallState>();

    state.getPremisAll();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _Premis(),
        ],
      ),
    );
  }
}

class _Premis extends StatelessWidget {
  const _Premis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HaddadMallState>(
      builder: (_, state, __) {
        return state.isLoading
            ? AppLoadingOverlay()
            : Column(
                children: [
                  ...List.generate(
                      state.premisAll!.length,
                      (index) => Column(
                            children: [
                              InkWell(
                                onTap: () async {
                                  // await state.getOrderIdWithPremis(
                                  //     state.premisAll![index].id!);
                                  //
                                  // if (state.orderId == null) {
                                  //   AppModal.showInformation(
                                  //       context,
                                  //       "Alert",
                                  //       "You are choosing from another premis.\n"
                                  //           "Your item(s) in cart will be deleted. Are you sure to proceed?",
                                  //       btnTitle: 'Yes', onTap: () async {
                                  //     await state.deleteOrder(
                                  //         context, state.premisAll![index].id!);
                                  //   });
                                  // } else if (state.orderId != null) {
                                  //   AppRoute.push(
                                  //       context,
                                  //       HaddadMallPage(
                                  //         premisId: state.premisAll![index].id,
                                  //       ));
                                  // }

                                  AppRoute.push(
                                      context,
                                      HaddadMallPage(
                                        premisId: state.premisAll![index].id,
                                      ));
                                },
                                child: Container(
                                  width: AppSize.widthScreen(context),
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          AppSize.mainSpaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor: grayColor,
                                              radius: 30,
                                              backgroundImage: NetworkImage(
                                                  imageURl +
                                                      state.premisAll![index]
                                                          .image!),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            TextManrope(
                                                text: state.premisAll![index]
                                                    .namaPremis!),
                                          ],
                                        ),
                                        TextManrope(
                                          text: state
                                              .premisAll![index]
                                              .pilihanLabel!
                                              .capitalizeFirstofEach,
                                          fontSize: 14,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ))
                ],
              );
      },
    );
  }
}

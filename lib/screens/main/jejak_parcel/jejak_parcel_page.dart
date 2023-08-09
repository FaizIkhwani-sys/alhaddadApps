import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class JejakParcelPage extends StatelessWidget {
  const JejakParcelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => JejakParcelState(),
      child: AppSecondaryBar(
        title: 'Jejak Parcel',
        body: _Body(),
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
    final state = context.read<JejakParcelState>();

    state.getOrdersTracking();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<JejakParcelState>(
      builder: (_, state, __) {
        return state.isLoading
            ? AppLoadingOverlay()
            : state.orderTracking == null
                ? Center(child: TextManrope(text: 'No tracking'))
                : _Tracking();
      },
    );
  }
}

class _Tracking extends StatelessWidget {
  const _Tracking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<JejakParcelState>(
      builder: (_, state, __) {
        return Column(
          children: [
            ...List.generate(
                state.orderTracking!.length,
                (index) => InkWell(
                      onTap: () {
                        AppRoute.push(
                            context,
                            TrackingWebView(
                                trackingNo: state.orderTracking![index]
                                    .orderTrackingNumber!));
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                          child: Row(
                            mainAxisAlignment: AppSize.mainSpaceBetween,
                            children: [
                              SizedBox(
                                  width: AppSize.widthScreen(context) * 0.5,
                                  child: TextManrope(
                                      maxLines: 10,
                                      textAlign: TextAlign.left,
                                      text: state.orderTracking![index]
                                                      .alamat2! !=
                                                  '' ||
                                              state.orderTracking![index]
                                                      .alamat3! !=
                                                  ''
                                          ? '${state.orderTracking![index].alamat!},' +
                                              ' ${state.orderTracking![index].alamat2!},' +
                                              ' ${state.orderTracking![index].alamat3!},' +
                                              ' ${state.orderTracking![index].poskod!},' +
                                              ' ${state.orderTracking![index].pilihanLabel!}.'
                                          : '${state.orderTracking![index].alamat!},' +
                                              ' ${state.orderTracking![index].poskod!},' +
                                              ' ${state.orderTracking![index].pilihanLabel!}.')),
                              Card(
                                color: primaryColor,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(4, 4, 4, 4),
                                  child: TextManrope(
                                    text: state.orderTracking![index]
                                        .orderTrackingNumber!,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))
          ],
        );
      },
    );
  }
}

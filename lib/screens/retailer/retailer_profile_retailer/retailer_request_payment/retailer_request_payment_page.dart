import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

late FocusNode _pointsNode;

class RetailerRequestPaymentPage extends StatelessWidget {
  const RetailerRequestPaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RetailerProfileState(),
      child: Consumer<RetailerProfileState>(
        builder: (_, state, __) {
          return AppSecondaryBar(
            title: 'Request Hibah',
            body: SingleChildScrollView(child: _Body()),
            backgroundColor: backgroundColor,
            bottomNavigationBar: _BottomNavigationBar(),
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

    final state = context.read<RetailerProfileState>();

    state.getAllRequestPayment();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RetailerProfileState>(
      builder: (_, state, __) {
        return state.isLoading
            ? AppLoadingOverlay()
            : Column(
                children: [
                  _Points(),
                  _History(),
                ],
              );
      },
    );
  }
}

class _Points extends StatelessWidget {
  const _Points({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RetailerProfileState>(
      builder: (_, state, __) {
        return Container(
          height: AppSize.heightScreen(context) * 0.2,
          width: AppSize.widthScreen(context),
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.7),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: AppSize.mainCenter,
              children: [
                TextManrope(
                  text: 'HIBAH BALANCE'.capitalizeFirstofEach,
                  fontSize: 20,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: AppSize.mainCenter,
                  children: [
                    Icon(
                      Icons.star_outline,
                      size: 30,
                    ),
                    TextManrope(
                      text: state.totalHibah![0].point!,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: AppSize.mainSpaceEvenly,
                  children: [
                    ...List.generate(
                        1,
                        (index) => Row(
                              children: [
                                _HibahCard(
                                    title: "Daily",
                                    points: state.dailyHibah![0].point!),
                                SizedBox(
                                  width: 10,
                                ),
                                _HibahCard(
                                    title: "Weekly",
                                    points: state.weeklyHibah![0].point!),
                                SizedBox(
                                  width: 10,
                                ),
                                _HibahCard(
                                    title: "Monthly",
                                    points: state.monthlyHibah![0].point!),
                              ],
                            ))
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class _HibahCard extends StatelessWidget {
  final String title;
  final String points;

  const _HibahCard({required this.title, required this.points, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.widthScreen(context) * 0.3,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextManrope(
              text: points,
              fontSize: AppSize.fontSize(context) * 20,
              color: points.contains('-') ? Colors.red : Colors.green,
            ),
            TextManrope(
              text: title,
              fontSize: AppSize.fontSize(context) * 12,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class _History extends StatelessWidget {
  const _History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RetailerProfileState>(
      builder: (_, state, __) {
        return state.requestPayment == null
            ? TextManrope(text: 'No request history')
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ...List.generate(
                        state.requestPayment!.length,
                        (i) => Container(
                              width: AppSize.widthScreen(context),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: AppSize.mainSpaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: AppSize.crossStart,
                                      children: [
                                        TextManrope(
                                          text:
                                              'Amount requested: ${state.requestPayment![i].amount}',
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextManrope(
                                          text:
                                              'Requested Date: ${DateFormat('dd-MM-yyyy').format(DateTime.parse(state.requestPayment![i].respondDate!))}',
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                    Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextManrope(
                                            text: getStatus(state
                                                .requestPayment![i].status!)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ))
                  ],
                ),
              );
      },
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppSubmitButton(
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return _BodyPanel();
                });
          },
          title: 'REQUEST HIBAH'),
    );
  }
}

class _BodyPanel extends StatelessWidget {
  const _BodyPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => RetailerProfileState(),
      child: _SlidingPanel(),
    );
  }
}

class _SlidingPanel extends StatefulWidget {
  const _SlidingPanel({Key? key}) : super(key: key);

  @override
  State<_SlidingPanel> createState() => _SlidingPanelState();
}

class _SlidingPanelState extends State<_SlidingPanel> {
  @override
  void initState() {
    super.initState();

    final state = context.read<RetailerProfileState>();

    state.getProfile();

    _pointsNode = FocusNode();
  }

  @override
  void dispose() {
    _pointsNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RetailerProfileState>(
      builder: (_, state, __) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                  child: AppTextField(
                focusNode: _pointsNode,
                label: 'Request Hibah',
                hint: '100',
                keyboardType: TextInputType.text,
                errorText: state.pointsHasError ? state.pointsError : null,
                onChange: (v) => state.points = v,
                onSubmitted: (v) => state.points = v,
              )),
              AppSubmitButton(
                  onTap: () async {
                    state.validatePoints();

                    if (state.pointsHasError) {
                      _pointsNode.requestFocus();
                      return;
                    }

                    await state.postLoyalty(state.points);

                    await state.postRequestPoint(context);
                  },
                  title: 'SUBMIT')
            ],
          ),
        );
      },
    );
  }
}

String getStatus(status) {
  switch (status) {
    case '1':
      return 'Berjaya';
      break;
    case '2':
      return 'Pending';
      break;
    case '3':
      return 'Gagal';
      break;
    default:
      return '';
  }
}

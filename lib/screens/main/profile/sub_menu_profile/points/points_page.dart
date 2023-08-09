import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

late FocusNode _pointsNode;

class PointsPage extends StatelessWidget {
  const PointsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => PointsState(),
      child: AppSecondaryBar(
        title: 'Hibah Points',
        body: _Body(),
        backgroundColor: backgroundColor,
        bottomNavigationBar: _BottomNavigationBar(),
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
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    final state = context.read<PointsState>();

    await Future.delayed(Duration(milliseconds: 1000));

    state.getAll();

    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    initState();

    _refreshController.loadComplete();
  }

  @override
  void initState() {
    super.initState();

    final state = context.read<PointsState>();

    state.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      physics: ScrollPhysics(),
      enablePullDown: true,
      header: WaterDropHeader(),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: Consumer<PointsState>(
        builder: (_, state, __) {
          return state.isLoading
              ? AppLoadingOverlay()
              : SingleChildScrollView(
                child: Column(
                    children: [
                      _Points(),
                      _History(),
                    ],
                  ),
              );
        },
      ),
    );
  }
}

class _Points extends StatelessWidget {
  const _Points({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PointsState>(
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
    return Consumer<PointsState>(
      builder: (_, state, __) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...List.generate(
                  state.loyalty!.length,
                  (i) => Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: AppSize.crossStart,
                            mainAxisAlignment: AppSize.mainSpaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: AppSize.crossStart,
                                children: [
                                  TextManrope(text: state.loyalty![i].remarks!),
                                  TextManrope(
                                      text: state.loyalty![i].createdAt!),
                                ],
                              ),
                              TextManrope(
                                text: state.loyalty![i].hpoint!,
                                color: state.loyalty![i].hpoint!.contains('-')
                                    ? Colors.red
                                    : Colors.green,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
          onTap: () => _onSubmitted(context), title: 'REQUEST HIBAH'),
    );
  }

  Future<void> _onSubmitted(BuildContext context) async {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return _BodyRequestHibah();
        });
  }
}

class _BodyRequestHibah extends StatelessWidget {
  const _BodyRequestHibah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => PointsState(),
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

    final state = context.read<PointsState>();

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
    return Consumer<PointsState>(
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

                    if (state.profileList![0].memberAktif! == '0') {
                      showDialog(
                        useSafeArea: true,
                        context: context,
                        builder: (_) => AppAlertDialog(
                          alertDialogType: AlertDialogType.warning,
                          title: 'SORRY',
                          subtitle:
                              'You are not active for the past 3 months.\nPlease make a purchase to renew your membership',
                          // description: 'Sila kemaskini maklumat anda.',
                          actionButtons: [
                            ActionButton(
                              label: 'BACK',
                              onTap: () => {
                                AppRoute.pop(context),
                              },
                              color: primaryColor,
                            ),
                          ],
                        ),
                      );
                    } else {
                      await state.postLoyalty(state.points);

                      await state.postRequestPoint(context);
                    }
                  },
                  title: 'SUBMIT')
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => NotificationState(),
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
  final bool flag = true;

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    final state = context.read<NotificationState>();

    await Future.delayed(Duration(milliseconds: 1000));

    state.getNotification();

    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    initState();

    _refreshController.loadComplete();
  }

  @override
  void initState() {
    final state = context.read<NotificationState>();

    state.getNotification();

    super.initState();
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
      child: Consumer<NotificationState>(
        builder: (context, state, child) {
          return state.isLoading
              ? AppLoadingOverlay()
              : state.notificationList == null
                  ? const _NoMessage()
                  : const _Notifications();
        },
      ),
    );
  }
}

class _NoMessage extends StatelessWidget {
  const _NoMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/no_message.png'),
          const SizedBox(height: 16.0),
          const Text(
            'Tiada sebarang notifikasi.',
            style: TextStyle(
              color: grayColor,
              fontSize: 16.0,
            ),
          )
        ],
      ),
    );
  }
}

class _Notifications extends StatelessWidget {
  const _Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationState>(
      builder: (_, state, __) {
        return state.isLoading
            ? AppLoadingOverlay()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    ...List.generate(
                        state.notificationList!.length,
                        (i) => AppNotificationCard(
                              title: state.notificationList![i].title!,
                              date:
                                  "${DateFormat('dd-MM-yyyy').format(DateTime.parse(state.notificationList![i].dateSend!))}",
                              description:
                                  state.notificationList![i].body ?? '',
                              image: state.notificationList![i].image!,
                              onTap: () async {
                                await state.updateReadAt(
                                    state
                                        .notificationList![i].idNotifikasiSend!,
                                    '${DateTime.now()}');

                                await AppRoute.push(
                                    context,
                                    NotificationDetailsPage(
                                      idNotification: state
                                          .notificationList![i].idNotifikasi!,
                                    ));
                              },
                              onDelete: () {
                                state.deleteNotification(state
                                    .notificationList![i].idNotifikasiSend!);
                                state.getNotification();
                              },
                              color: state.notificationList![i].readAt! == ''
                                  ? Colors.white
                                  : Colors.grey.withOpacity(0.3),
                              readAt: state.notificationList![i].readAt,
                            )),
                  ],
                ),
              );
      },
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(height: 1.0);
  }
}

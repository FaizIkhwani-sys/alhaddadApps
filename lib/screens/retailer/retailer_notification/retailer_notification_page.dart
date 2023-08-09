import 'package:apps_al_haddad/widgets/input/app_upload_field.dart';
import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


late FocusNode _titleNode;
late FocusNode _descNode;

class RetailerNotificationPage extends StatelessWidget {
  const RetailerNotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => NotificationState(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: _Body(),
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
  final bool flag = true;

  RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));

    final state = context.read<NotificationState>();

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
          return state.notificationList == null
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
            : state.notificationList == null
                ? Center(child: TextManrope(text: 'No notification'))
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        ...List.generate(
                            state.notificationList!.length,
                            (i) => AppNotificationCard(
                                  readAt: state.notificationList![i].readAt,
                                  title: state.notificationList![i].title!,
                                  date:
                                      "${DateFormat('dd-MM-yyyy').format(DateTime.parse(state.notificationList![i].dateSend!))}",
                                  description:
                                      state.notificationList![i].body ?? '',
                                  image: state.notificationList![i].image!,
                                  onTap: () async {
                                    await state.updateReadAt(
                                        state.notificationList![i]
                                            .idNotifikasiSend!,
                                        '${DateTime.now()}');

                                    await AppRoute.push(
                                        context,
                                        NotificationDetailsPage(
                                          idNotification: state
                                              .notificationList![i]
                                              .idNotifikasi!,
                                          head: state.notificationList![i].title!,
                                        ));
                                  },
                                  onDelete: () {
                                    state.deleteNotification(state
                                        .notificationList![i]
                                        .idNotifikasiSend!);
                                    state.getNotification();
                                  },
                                  color:
                                      state.notificationList![i].readAt! == ''
                                          ? Colors.white
                                          : Colors.grey.withOpacity(0.3),
                                )),
                      ],
                    ),
                  );
      },
    );
    // return ListView.separated(
    //   itemCount: 5,
    //   itemBuilder: (_, index) {
    //     return AppNotificationCard(
    //       title: notificationTitle,
    //       date: '20-10-2021',
    //       description: notificationDescription,
    //       onTap: () => AppRoute.push(context, const NotificationDetailsPage()),
    //     );
    //   },
    //   separatorBuilder: (_, __) => const _Divider(),
    // );
  }
}

class _Divider extends StatelessWidget {
  const _Divider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(height: 1.0);
  }
}

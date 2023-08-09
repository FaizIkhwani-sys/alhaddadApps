import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:intl/intl.dart';

class NotificationDetailsPage extends StatelessWidget {
  final String? idNotification;
  final String? head;

  const NotificationDetailsPage({this.idNotification, this.head, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => NotificationState(),
      child: AppSecondaryBar(
        title: 'Maklumat Notifikasi',
        body: _Body(
          idNotification: idNotification,
        ),
        bottomNavigationBar: head!.startsWith('[N001]')
            ? _BottomNavigationBar(
                head: head,
              )
            : Container(),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  final String? idNotification;

  const _Body({this.idNotification, Key? key}) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  void initState() {
    super.initState();
    context
        .read<NotificationState>()
        .getNotificationbyId(widget.idNotification!);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationState>(
      builder: (_, state, __) {
        return state.isLoading
            ? AppLoadingOverlay()
            : SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: _Content(),
              );
      },
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationState>(
      builder: (_, state, __) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Date(),
            SizedBox(height: 16.0),
            _Title(),
            SizedBox(height: 8.0),
            _Description(),
            SizedBox(height: 8.0),
            state.notification![0].image == '' ||
                    state.notification![0].image == null
                ? Container()
                : _Image(),
          ],
        );
      },
    );
  }
}

class _Date extends StatelessWidget {
  const _Date({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationState>(
      builder: (_, state, __) {
        return Text(
          '${DateFormat('dd-MM-yyyy').format(DateTime.parse(state.notification![0].dateSend!))}  |  ${DateFormat('HH:mm').format(DateTime.parse(state.notification![0].dateSend!))}',
          style: TextStyle(
            color: grayColor,
          ),
        );
      },
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationState>(
      builder: (_, state, __) {
        return Text(
          state.notification![0].title!,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        );
      },
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationState>(
      builder: (_, state, __) {
        return Text(
          state.notification![0].body!.capitalizeFirstofEach,
          style: const TextStyle(
            color: Colors.black54,
          ),
        );
      },
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationState>(
      builder: (_, state, __) {
        return SizedBox(
          width: AppSize.widthScreen(context),
          height: AppSize.heightScreen(context) * 0.4,
          child: Image.network(imageURl + state.notification![0].image!),
        );
      },
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  final String? head;
  const _BottomNavigationBar({this.head, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationState>(
      builder: (_, state, __) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppSubmitButton(
            title: 'DELETE ORDER',
            onTap: () => _onSubmitted(context),
          ),
        );
      },
    );
  }

  Future<void> _onSubmitted(BuildContext context) async {
    final state = context.read<NotificationState>();

    await state.deleteOrderPOS(context, state.notification![0].params!);
  }
}

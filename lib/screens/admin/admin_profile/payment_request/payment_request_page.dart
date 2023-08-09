import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';

late FocusNode _searchNode;

class RequestPaymentPage extends StatelessWidget {
  const RequestPaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AdminProfileState(),
      child: Consumer<AdminProfileState>(
        builder: (_, state, __) {
          return AppSecondaryBar(
            title: 'Payment Request',
            body: SingleChildScrollView(child: _Body()),
            backgroundColor: backgroundColor,
            actions: [
              InkWell(
                onTap: () {
                  state.isClicked = !state.isClicked;
                },
                child: Icon(Icons.search),
              )
            ],
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

    final state = context.read<AdminProfileState>();

    state.getPaymentRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminProfileState>(
      builder: (_, state, __) {
        return state.isLoading
            ? AppLoadingOverlay()
            : state.paymentRequest == null
                ? Center(
                    child: TextManrope(
                      text: 'No request for now',
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ...List.generate(
                            state.paymentRequest!.length,
                            (index) => Column(
                                  children: [
                                    _PaymentCard(
                                      image:
                                          state.paymentRequest![index].image!,
                                      name: state
                                          .paymentRequest![index].namaPenuh!,
                                      points:
                                          state.paymentRequest![index].amount!,
                                      done: () {
                                        state.updateDone(context,
                                            state.paymentRequest![index].id!);
                                      },
                                      reject: () {
                                        state.updateReject(context,
                                            state.paymentRequest![index].id!);
                                      },
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                )),
                      ],
                    ),
                  );
      },
    );
  }
}

class _PaymentCard extends StatelessWidget {
  final String image;
  final String name;
  final String points;
  final Function() done;
  final Function() reject;

  const _PaymentCard(
      {required this.image,
      required this.name,
      required this.points,
      required this.done,
      required this.reject,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminProfileState>(
      builder: (_, state, __) {
        return Container(
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Row(
              children: [
                _Image(
                  image: image,
                ),
                _Details(
                  name: name,
                  points: points,
                ),
                _Buttons(
                  done: done,
                  reject: reject,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Image extends StatelessWidget {
  final String image;

  const _Image({required this.image, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.widthScreen(context) * 0.15,
      height: AppSize.heightScreen(context) * 0.1,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: NetworkImage('${imageURl + image}'))),
    );
  }
}

class _Details extends StatelessWidget {
  final String name;
  final String points;

  const _Details({required this.name, required this.points, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: Column(
        crossAxisAlignment: AppSize.crossStart,
        children: [
          SizedBox(
            width: AppSize.widthScreen(context) * 0.52,
            child: TextManrope(
              text: name,
              maxLines: 3,
              textAlign: TextAlign.left,
              fontSize: 14,
            ),
          ),
          TextManrope(
            text: '$points points',
            fontSize: 20,
          ),
        ],
      ),
    );
  }
}

class _Buttons extends StatelessWidget {
  final Function() done;
  final Function() reject;

  const _Buttons({required this.done, required this.reject, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Column(
        children: [
          InkWell(
            onTap: done,
            child: Container(
              width: AppSize.widthScreen(context) * 0.2,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextManrope(
                  text: 'ACCEPT',
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: reject,
            child: Container(
              width: AppSize.widthScreen(context) * 0.2,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextManrope(
                  text: 'REJECT',
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

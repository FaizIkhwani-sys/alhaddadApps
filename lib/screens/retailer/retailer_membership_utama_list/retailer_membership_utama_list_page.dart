import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:scroll_navigation/misc/navigation_helpers.dart';
import 'package:scroll_navigation/navigation/scroll_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

late FocusNode _agentNode;
late FocusNode _retailerBigNode;
late FocusNode _retailerMediumNode;
late FocusNode _retailerSmallNode;

String? bearer;

class RetailerMembershipUtamaListPage extends StatelessWidget {
  final String? bearer;

  const RetailerMembershipUtamaListPage({this.bearer, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _BodyWebView(
      bearer: bearer,
    );
  }
}

class _BodyWebView extends StatefulWidget {
  final String? bearer;
  const _BodyWebView({this.bearer, Key? key}) : super(key: key);

  @override
  State<_BodyWebView> createState() => _BodyWebViewState();
}

class _BodyWebViewState extends State<_BodyWebView> {
  @override
  void initState() {
    super.initState();

    getBearer();

    // setState(() async {
    //
    // });

    // SchedulerBinding.instance.addPostFrameCallback((_) async {
    //
    // });

    // print("deyyy widget ${widget.bearer}");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(
              getUrl(),
            ),
            headers: {"Authorization": "Bearer $bearerToken"},
          ),
          initialOptions: InAppWebViewGroupOptions(
            android: AndroidInAppWebViewOptions(
              cacheMode: AndroidCacheMode.LOAD_NO_CACHE,
              domStorageEnabled: true,
              databaseEnabled: true,
            ),
          ),
          // ),
          onConsoleMessage: (controller, consoleMessage) async {
            SharedPreferences _prefsPOS = await SharedPreferences.getInstance();
            final state = context.read<TryState>();

            if (consoleMessage.message.contains("BearerTokenPOS")) {
              String string = consoleMessage.message;
              final splitted = string.split('|');
              await _prefsPOS.setString("BTPOS", splitted[1]);
              print("console: ${consoleMessage.message}");
              print("${splitted[1]}");
            } else {
              String string = consoleMessage.message;
              final splitted = string.split('|');
              print("console: ${consoleMessage.message}");
              await _prefsPOS.setString("idOrder", splitted[1]);
              print("${splitted[1]}");
              if (splitted[2] != " " || splitted[2] == "1") {
                state.getOrderDetailsOffline();
              } else {
                state.getReceiptDetails();
              }
            }

            // state.kitchenPrinter2();
            // print("geturl ${controller.getUrl()}");
          },
          onWebViewCreated: (InAppWebViewController controller) {
            InAppWebViewController? webView;
            webView = controller;

            controller.addJavaScriptHandler(
                handlerName: "POSHandler",
                callback: (args) {
                  // Here you receive all the arguments from the JavaScript side
                  // that is a List<dynamic>
                  print("From the JavaScript side:");
                  print("argument $args");
                  print("geturl ${controller.getUrl()}");
                  // return args.reduce((curr, next) => curr + next);
                });
          },
          onLoadStart: (InAppWebViewController controller, url) {
            print(" ini url kita $url");
          },
          onReceivedServerTrustAuthRequest: (InAppWebViewController controller,
              URLAuthenticationChallenge challenge) async {
            return ServerTrustAuthResponse(
                action: ServerTrustAuthResponseAction.PROCEED);
          },
        ));
  }

  getBearer() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    bearer = _prefs.getString('BearerToken');

    print("sini dey $bearer");

    getUrl();

    return bearer;
  }

  String getUrl() {
    String url =
        'https://alhaddad-admin.myrichappsproject.tk/stockist_agent_membership_list_sub?noHeader=1&apps=1&bearer=$bearer';

    return url;
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
    final state = context.read<RetailerMembershipUtamaListState>();
    state.getRetailerBig('');
    state.getRetailerMedium('');
    state.getRetailerSmall('');
    state.getMembership('');
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: _TabBarAdmin());
  }
}

class _TabBarAdmin extends StatelessWidget {
  const _TabBarAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollNavigation(
      bodyStyle: NavigationBodyStyle(
        background: Colors.white,
      ),
      barStyle: NavigationBarStyle(
        position: NavigationPosition.top,
        background: Colors.white,
        elevation: 0.5,
      ),
      pages: [
        _StokisBig(),
        _StokisMedium(),
        _StokisSmall(),
        _Agent(),
      ],
      items: [
        ScrollNavigationItem(
            icon: TextManrope(
          text: 'Big',
          fontWeight: FontWeight.bold,
        )),
        ScrollNavigationItem(
            icon: TextManrope(
          text: 'Medium',
          fontWeight: FontWeight.bold,
        )),
        ScrollNavigationItem(
            icon: TextManrope(
          text: 'Small',
          fontWeight: FontWeight.bold,
        )),
        ScrollNavigationItem(
            icon: TextManrope(
          text: 'Membership',
          fontWeight: FontWeight.bold,
        )),
      ],
    );
  }
}

class _StokisBig extends StatefulWidget {
  const _StokisBig({Key? key}) : super(key: key);

  @override
  State<_StokisBig> createState() => _StokisBigState();
}

class _StokisBigState extends State<_StokisBig> {
  @override
  void initState() {
    super.initState();
    _retailerBigNode = FocusNode();
  }

  @override
  void dispose() {
    _retailerBigNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RetailerMembershipUtamaListState>(
      builder: (_, state, __) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: AppTextFieldWithLabel(
                  focusNode: _retailerBigNode,
                  hint: "search name...",
                  keyboardType: TextInputType.text,
                  onChange: (v) => state.searchRetailerBig = v,
                  onSubmitted: (v) => state.searchRetailerBig = v,
                ),
              ),
              state.isLoading
                  ? AppLoadingOverlay()
                  : state.retailerBigList == null
                      ? Center(
                          child: TextManrope(
                            text: 'sorry, no search result...',
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ...List.generate(
                                  state.retailerBigList!.length,
                                  (i) => _MembershipCard(
                                        name:
                                            state.retailerBigList![i].namaPenuh,
                                        image: state.retailerBigList![i].image,
                                        level: state
                                            .retailerBigList![i].pilihanLabel,
                                        phone: state.retailerBigList![i].noTel,
                                      ))
                            ],
                          ),
                        ),
            ],
          ),
        );
      },
    );
  }
}

class _StokisMedium extends StatefulWidget {
  const _StokisMedium({Key? key}) : super(key: key);

  @override
  State<_StokisMedium> createState() => _StokisMediumState();
}

class _StokisMediumState extends State<_StokisMedium> {
  @override
  void initState() {
    super.initState();
    _retailerMediumNode = FocusNode();
  }

  @override
  void dispose() {
    _retailerMediumNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RetailerMembershipUtamaListState>(
      builder: (_, state, __) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: AppTextFieldWithLabel(
                  focusNode: _retailerMediumNode,
                  hint: "search name...",
                  keyboardType: TextInputType.text,
                  onChange: (v) => state.searchRetailerMedium = v,
                  onSubmitted: (v) => state.searchRetailerMedium = v,
                ),
              ),
              state.isLoading
                  ? AppLoadingOverlay()
                  : state.retailerMediumList == null
                      ? Center(
                          child: TextManrope(
                            text: 'sorry, no search result...',
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ...List.generate(
                                  state.retailerMediumList!.length,
                                  (i) => _MembershipCard(
                                        name: state
                                            .retailerMediumList![i].namaPenuh,
                                        image:
                                            state.retailerMediumList![i].image,
                                        level: state.retailerMediumList![i]
                                            .pilihanLabel,
                                        phone:
                                            state.retailerMediumList![i].noTel,
                                      ))
                            ],
                          ),
                        ),
            ],
          ),
        );
      },
    );
  }
}

class _StokisSmall extends StatefulWidget {
  const _StokisSmall({Key? key}) : super(key: key);

  @override
  State<_StokisSmall> createState() => _StokisSmallState();
}

class _StokisSmallState extends State<_StokisSmall> {
  @override
  void initState() {
    super.initState();
    _retailerSmallNode = FocusNode();
  }

  @override
  void dispose() {
    _retailerSmallNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RetailerMembershipUtamaListState>(
      builder: (_, state, __) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: AppTextFieldWithLabel(
                  focusNode: _retailerSmallNode,
                  hint: "search name...",
                  keyboardType: TextInputType.text,
                  onChange: (v) => state.searchRetailerSmall = v,
                  onSubmitted: (v) => state.searchRetailerSmall = v,
                ),
              ),
              state.isLoading
                  ? AppLoadingOverlay()
                  : state.retailerSmallList == null
                      ? Center(
                          child: TextManrope(
                            text: 'sorry, no search result...',
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ...List.generate(
                                  state.retailerSmallList!.length,
                                  (i) => _MembershipCard(
                                        name: state
                                            .retailerSmallList![i].namaPenuh,
                                        image:
                                            state.retailerSmallList![i].image,
                                        level: state
                                            .retailerSmallList![i].pilihanLabel,
                                        phone:
                                            state.retailerSmallList![i].noTel,
                                      ))
                            ],
                          ),
                        ),
            ],
          ),
        );
      },
    );
  }
}

class _Agent extends StatefulWidget {
  const _Agent({Key? key}) : super(key: key);

  @override
  State<_Agent> createState() => _AgentState();
}

class _AgentState extends State<_Agent> {
  @override
  void initState() {
    super.initState();
    _agentNode = FocusNode();
  }

  @override
  void dispose() {
    _agentNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RetailerMembershipUtamaListState>(
      builder: (_, state, __) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: AppTextFieldWithLabel(
                  focusNode: _agentNode,
                  hint: "search name...",
                  keyboardType: TextInputType.text,
                  onChange: (v) => state.searchAgent = v,
                  onSubmitted: (v) => state.searchAgent = v,
                ),
              ),
              state.isLoading
                  ? AppLoadingOverlay()
                  : state.membershipList == null
                      ? Center(
                          child: TextManrope(
                            text: 'sorry, no search result...',
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ...List.generate(
                                  state.membershipList!.length,
                                  (i) => _MembershipCard(
                                        name:
                                            state.membershipList![i].namaPenuh,
                                        image: state.membershipList![i].image,
                                        level: state
                                            .membershipList![i].pilihanLabel,
                                        phone: state.membershipList![i].noTel,
                                      ))
                            ],
                          ),
                        ),
            ],
          ),
        );
      },
    );
  }
}

class _MembershipCard extends StatelessWidget {
  final String? name;
  final String? phone;
  final String? image;
  final String? level;

  const _MembershipCard(
      {this.name, this.phone, this.image, this.level, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  child: Container(
                    width: AppSize.widthScreen(context) * 0.3,
                    height: AppSize.heightScreen(context) * 0.4,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage('${imageURl + image!}'))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Column(
                    crossAxisAlignment: AppSize.crossStart,
                    children: [
                      SizedBox(
                        width: AppSize.widthScreen(context) * 0.62,
                        child: TextManrope(
                          text: name!.capitalizeFirstofEach,
                          maxLines: 4,
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextManrope(
                        text: level!.capitalizeFirstofEach,
                        fontStyle: FontStyle.italic,
                      ),
                      TextManrope(text: phone!),
                    ],
                  ),
                ),
                InkWell(
                    onTap: () async {
                      launchUrl(Uri.parse('tel://$phone'));
                    },
                    child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.phone,
                          color: Colors.green,
                        ))),
              ],
            ),
          ),
        ),
        SizedBox(
          height: AppSize.heightScreen(context) * 0.01,
        )
      ],
    );
  }
}

// code untuk table

// child: Table(
//   columnWidths: {0: FractionColumnWidth(0.11)},
//   defaultVerticalAlignment: TableCellVerticalAlignment.middle,
//   border: TableBorder.all(color: Colors.black.withOpacity(0.3)),
//   children: [
//     TableRow(children: [
//       Container(
//           color: primaryColor,
//           child: TextManrope(
//             text: 'Bil.',
//             color: Colors.white,
//           )),
//       Container(
//           color: primaryColor,
//           child: TextManrope(
//             text: 'Nama',
//             color: Colors.white,
//           )),
//       Container(
//           color: primaryColor,
//           child: TextManrope(
//             text: 'Produk',
//             color: Colors.white,
//           )),
//       Container(
//           color: primaryColor,
//           child: TextManrope(
//             text: 'Status',
//             color: Colors.white,
//           )),
//     ]),
//     ...List.generate(
//       12,
//       (index) => TableRow(children: [
//         TextManrope(text: '${index + 1}.'),
//         TextManrope(
//           text: 'AHMAD OMAR DAN HANA',
//           maxLines: 10,
//         ),
//         TextManrope(
//           text: 'Produk',
//           maxLines: 10,
//         ),
//         InkWell(
//           onTap: () {
//             print('tekan sini ${index + 1}');
//           },
//           child: Center(
//             child: TextManrope(
//               text: 'Status',
//               maxLines: 10,
//             ),
//           ),
//         ),
//       ]),
//     )
//   ],
// ),

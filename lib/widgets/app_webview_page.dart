import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppWebViewPage extends StatelessWidget {
  final String appBarTitle;
  final String url;
  final bool? hasBackButton;
  final String? bearerToken;
  final bool hasAction;
  final List<Widget>? action;

  AppWebViewPage({
    required this.appBarTitle,
    required this.url,
    this.hasBackButton,
    this.bearerToken,
    this.hasAction = false,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    print('sini $url');
    return AppSecondaryBar(
      hasBackButton: hasBackButton!,
      title: appBarTitle,
      actions: hasAction ? action : [Container()],
      body: Container(
          alignment: Alignment.center,
          child: InAppWebView(
            initialUrlRequest: URLRequest(
              url: Uri.parse(
                "$url",
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
              SharedPreferences _prefsPOS =
                  await SharedPreferences.getInstance();
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
            onReceivedServerTrustAuthRequest:
                (InAppWebViewController controller,
                    URLAuthenticationChallenge challenge) async {
              return ServerTrustAuthResponse(
                  action: ServerTrustAuthResponseAction.PROCEED);
            },
          )),
    );
  }
}

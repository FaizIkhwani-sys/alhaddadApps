import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class RegisterWebViewPage extends StatelessWidget {
  final String? url;

  const RegisterWebViewPage({this.url, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppSecondaryBar(
      title: "Pendaftaran Ahli",
      hasBackButton: true,
      body: Container(
          alignment: Alignment.center,
          child: InAppWebView(
            initialUrlRequest: URLRequest(
              url: Uri.parse(
                // "https://www.youtube.com/",
                url!,
              ),
            ),
            initialOptions: InAppWebViewGroupOptions(
              android: AndroidInAppWebViewOptions(
                domStorageEnabled: true,
                databaseEnabled: true,
              ),
            ),
            // ),
            onWebViewCreated: (InAppWebViewController controller) {
              InAppWebViewController? webView;
              webView = controller;
            },
            onUpdateVisitedHistory: (controller, url, androidIsReload) {
              print(url);
              // if(url.toString().contains("episod+cinta")){
              if (url.toString().contains("registerComplete=1")) {
                AppRoute.pushAndRemoveUntil(context, LogInPage());
                // showDialog(
                //   useSafeArea: true,
                //   context: context,
                //   builder: (_) => AppAlertDialog(
                //     alertDialogType: AlertDialogType.success,
                //     title: 'Tahniah',
                //     subtitle: 'Anda telah berjaya mendaftar.',
                //     // description: 'Sila kemaskini maklumat anda.',
                //     actionButtons: [
                //       ActionButton(
                //         label: 'Log Masuk',
                //         onTap: () => AppRoute.pushAndRemoveUntil(context, LogInPage()),
                //         color: successColor,
                //       ),
                //     ],
                //   ),
                // );
              }
            },
            onLoadStart: (InAppWebViewController controller, url) {},
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

class RegisterDownLineWebViewPage extends StatelessWidget {
  final String? url;

  const RegisterDownLineWebViewPage({this.url, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppSecondaryBar(
      title: "Pendaftaran Ahli",
      hasBackButton: true,
      body: Container(
          alignment: Alignment.center,
          child: InAppWebView(
            initialUrlRequest: URLRequest(
              url: Uri.parse(
                // "https://www.youtube.com/",
                url!,
              ),
            ),
            initialOptions: InAppWebViewGroupOptions(
              android: AndroidInAppWebViewOptions(
                domStorageEnabled: true,
                databaseEnabled: true,
              ),
            ),
            // ),
            onWebViewCreated: (InAppWebViewController controller) {
              InAppWebViewController? webView;
              webView = controller;
            },
            onUpdateVisitedHistory: (controller, url, androidIsReload) {
              print(url);
              // if(url.toString().contains("episod+cinta")){
              if (url.toString().contains("registerComplete=1")) {
                AppRoute.pop(context);
                AppRoute.pop(context);
                // showDialog(
                //   useSafeArea: true,
                //   context: context,
                //   builder: (_) => AppAlertDialog(
                //     alertDialogType: AlertDialogType.success,
                //     title: 'Tahniah',
                //     subtitle: 'Anda telah berjaya mendaftar.',
                //     // description: 'Sila kemaskini maklumat anda.',
                //     actionButtons: [
                //       ActionButton(
                //         label: 'Log Masuk',
                //         onTap: () => AppRoute.pushAndRemoveUntil(context, LogInPage()),
                //         color: successColor,
                //       ),
                //     ],
                //   ),
                // );
              }
            },
            onLoadStart: (InAppWebViewController controller, url) {},
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

import 'package:apps_al_haddad/al_haddad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentGatewayPage extends StatelessWidget {
  final String? billerCode;
  final String? idProfil;
  final String? cashGiven;
  final String? shippingCost;
  final String? pointsDeduct;
  final String? grandTotal;
  final String? noIc;
  final String? namaPenuh;
  final String? noTel;
  final bool? selfCollect;

  const PaymentGatewayPage(
      {Key? key,
      this.billerCode,
      this.idProfil,
      this.cashGiven,
      this.shippingCost,
      this.pointsDeduct,
      this.grandTotal,
      this.noIc,
      this.namaPenuh,
      this.noTel,
      this.selfCollect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => CartState(),
        child: _ToyyibPay(
          billerCode: billerCode,
          idProfil: idProfil,
          cashGiven: cashGiven,
          shippingCost: shippingCost,
          pointsDeduct: pointsDeduct,
          grandTotal: grandTotal,
          noIc: noIc,
          namaPenuh: namaPenuh,
          noTel: noTel,
          selfCollect: selfCollect,
        ));
  }
}

class _ToyyibPay extends StatefulWidget {
  final String? billerCode;
  final String? idProfil;
  final String? cashGiven;
  final String? shippingCost;
  final String? pointsDeduct;
  final String? grandTotal;
  final String? noIc;
  final String? namaPenuh;
  final String? noTel;
  final bool? selfCollect;

  const _ToyyibPay(
      {this.billerCode,
      this.idProfil,
      this.cashGiven,
      this.shippingCost,
      this.pointsDeduct,
      this.grandTotal,
      this.noIc,
      this.namaPenuh,
      this.noTel,
      this.selfCollect,
      Key? key})
      : super(key: key);

  @override
  State<_ToyyibPay> createState() => _ToyyibPayState();
}

class _ToyyibPayState extends State<_ToyyibPay> {
  InAppWebViewController? webView;

  @override
  void initState() {
    super.initState();
  }

  //this part isn't working
  @override
  void dispose() {
    _ToyyibPayState();
    // close the webview here
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartState>(
      builder: (_, state, __) {
        return AppSecondaryBar(
          hasBackButton: true,
          title: "Payment",
          body: Container(
            child: InAppWebView(
              initialUrlRequest: URLRequest(
                url: Uri.parse(
                  "https://toyyibpay.com/${widget.billerCode}",
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
                webView = controller;
              },
              onLoadStart: (InAppWebViewController controller, url) async {
                print(url);
                // if (url.toString().contains("status_id=3")) {
                //   await state.getSetting();
                //   await state.getSubTotal();
                //   await state.getCashGiven();
                //   await state.getProfile();
                //   await state.getUserPoints();
                //   await state.updateCashGiven(
                //       url.toString(), widget.cashGiven!);
                //   await state.updatePointDeduct('0.00');
                // } else
                if (url.toString().contains("status_id=3")) {
                  SharedPreferences _prefs =
                      await SharedPreferences.getInstance();

                  if (widget.selfCollect == true) {
                    print('sini betui');
                    print(widget.pointsDeduct);
                    await state.updateAlamat();
                    await state.postLoyalty(widget.pointsDeduct!);
                    await state.updateOrderDetails(
                        widget.cashGiven!,
                        widget.shippingCost!,
                        widget.pointsDeduct!,
                        widget.grandTotal!,
                        widget.noIc!,
                        widget.namaPenuh!,
                        widget.noTel!,
                        '');
                  } else if (widget.selfCollect == false) {
                    print('sini salah');
                    await state.postLoyalty(widget.pointsDeduct!);
                    await state.updateOrderDetails(
                        widget.cashGiven!,
                        widget.shippingCost!,
                        widget.pointsDeduct!,
                        widget.grandTotal!,
                        widget.noIc!,
                        widget.namaPenuh!,
                        widget.noTel!,
                        widget.billerCode!);
                  }

                  // await _prefs.remove('orderId');
                }
              },
              onReceivedServerTrustAuthRequest:
                  (InAppWebViewController controller,
                      URLAuthenticationChallenge challenge) async {
                return ServerTrustAuthResponse(
                    action: ServerTrustAuthResponseAction.PROCEED);
              },
            ),
          ),
        );
      },
    );
  }
}

String _getUrl(String? billerCode) {
  String url = 'https://toyyibpay.com/$billerCode';
  print(url);
  return url;
}

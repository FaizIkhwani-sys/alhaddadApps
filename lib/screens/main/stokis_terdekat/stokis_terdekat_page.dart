import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:url_launcher/url_launcher.dart';

class StokisTerdekatpage extends StatelessWidget {
  const StokisTerdekatpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => StokisTerdekatState(),
      child: AppSecondaryBar(
          title: "Lokasi Stokis", body: SingleChildScrollView(child: _Body())),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<StokisTerdekatState>().getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StokisTerdekatState>(builder: (_, state, __) {
      return state.isLoading
          ? AppLoadingOverlay()
          : state.stokisTerdekatList == null
              ? Center(
                  child: TextManrope(
                    text: 'No available store',
                  ),
                )
              : _Content();
    });
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StokisTerdekatState>(
      builder: (_, state, __) {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 0.6,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                ...List.generate(
                    state.stokisTerdekatList!.length,
                    (i) => _StokisCard(
                          image: state.stokisTerdekatList![i].image!,
                          premisName: state.stokisTerdekatList![i].namaPremis!,
                          address: state.stokisTerdekatList![i].alamat2 == '' ||
                                  state.stokisTerdekatList![i].alamat3 == ''
                              ? '${state.stokisTerdekatList![i].alamat}, ' +
                                  '${state.stokisTerdekatList![i].bandar}, ' +
                                  '${state.stokisTerdekatList![i].poskod}, ' +
                                  '${state.stokisTerdekatList![i].negeri}'
                              : '${state.stokisTerdekatList![i].alamat}, ' +
                                  '${state.stokisTerdekatList![i].alamat2 ?? ''}, ' +
                                  '${state.stokisTerdekatList![i].alamat3 ?? ''}, ' +
                                  '${state.stokisTerdekatList![i].bandar}, ' +
                                  '${state.stokisTerdekatList![i].poskod}, ' +
                                  '${state.stokisTerdekatList![i].negeri}',
                          distance: state.stokisTerdekatList![i].jarakRadiusKM,
                          lat: state.stokisTerdekatList![i].latitude,
                          long: state.stokisTerdekatList![i].longitude,
                        ))
              ],
            )

            // Column(
            //   children: [
            //     ...List.generate(
            //         state.stokisTerdekatList!.length,
            //         (i) => _StokisTerdekat(
            //               namaStokis: state.stokisTerdekatList![i].namaPremis,
            //               alamat: state.stokisTerdekatList![i].alamat2 == '' ||
            //                       state.stokisTerdekatList![i].alamat3 == ''
            //                   ? '${state.stokisTerdekatList![i].alamat}, ' +
            //                       '${state.stokisTerdekatList![i].bandar}, ' +
            //                       '${state.stokisTerdekatList![i].poskod}, ' +
            //                       '${state.stokisTerdekatList![i].negeri}'
            //                   : '${state.stokisTerdekatList![i].alamat}, ' +
            //                       '${state.stokisTerdekatList![i].alamat2 ?? ''}, ' +
            //                       '${state.stokisTerdekatList![i].alamat3 ?? ''}, ' +
            //                       '${state.stokisTerdekatList![i].bandar}, ' +
            //                       '${state.stokisTerdekatList![i].poskod}, ' +
            //                       '${state.stokisTerdekatList![i].negeri}',
            //               lat: state.stokisTerdekatList![i].latitude!,
            //               long: state.stokisTerdekatList![i].longitude!,
            //               distance: state.stokisTerdekatList![i].jarakRadiusKM,
            //             ))
            //   ],
            // ),
            );
      },
    );
  }
}

class _StokisTerdekat extends StatelessWidget {
  final String lat;
  final String long;
  final String? namaStokis;
  final String? alamat;
  final String? distance;

  _StokisTerdekat({
    required this.lat,
    required this.long,
    this.distance,
    this.namaStokis,
    this.alamat,
  });

  @override
  Widget build(BuildContext context) {
    return AppStokisTerdekatCard(
      title: namaStokis!,
      alamat: alamat!,
      distance: distance,
      onGoogleMapsTapped: () => _onGoogleMapsTapped(lat, long),
      onWazeTapped: () => _onWazeTapped(lat, long),
    );
  }
}

class _StokisCard extends StatelessWidget {
  final String? image;
  final String? premisName;
  final String? address;
  final String? distance;
  final String? lat;
  final String? long;

  const _StokisCard(
      {this.image,
      this.premisName,
      this.address,
      this.distance,
      this.lat,
      this.long,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.widthScreen(context) * 0.45,
      child: Column(
        children: [
          Container(
            height: AppSize.heightScreen(context) * 0.15,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                image: DecorationImage(
                  image: NetworkImage(imageURl + image!),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: Colors.black.withOpacity(0.5),
                )),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15)),
                  border: Border.all(
                    color: Colors.black.withOpacity(0.5),
                  ),
                  color: primaryColor.withOpacity(0.6)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: AppSize.mainSpaceBetween,
                  children: [
                    TextManrope(
                      text: premisName!.capitalizeFirstofEach,
                      maxLines: 5,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    TextManrope(
                      text: address!.capitalizeFirstofEach,
                      fontSize: 12,
                      maxLines: 10,
                    ),
                    TextManrope(
                      text: 'Distance: ${distance!}KM',
                      fontSize: 12,
                    ),
                    Row(
                      mainAxisAlignment: AppSize.mainSpaceEvenly,
                      children: [
                        InkWell(
                          onTap: () => _onGoogleMapsTapped(lat!, long!),
                          child: Image.asset(
                            'assets/images/google_maps.png',
                            width: 30.0,
                          ),
                        ),
                        InkWell(
                          onTap: () => _onWazeTapped(lat!, long!),
                          child: Image.asset(
                            'assets/images/waze.png',
                            width: 30.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

_onGoogleMapsTapped(String lat, String long) async {
  var url = 'google.navigation:q=$lat,$long';
  var fallbackUrl =
      'https://www.google.com/maps/search/?api=1&query=$lat,$long';

  try {
    bool launched =
        await launch(url, forceSafariVC: false, forceWebView: false);
    if (!launched) {
      await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
    }
  } catch (e) {
    await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
  }
}

_onWazeTapped(String lat, String long) async {
  var url = 'waze://?ll=$lat,$long';
  var fallbackUrl = 'https://waze.com/ul?ll=$lat,$long&navigate=yes';
  try {
    bool launched =
        await launch(url, forceSafariVC: false, forceWebView: false);
    if (!launched) {
      await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
    }
  } catch (e) {
    await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
  }
}

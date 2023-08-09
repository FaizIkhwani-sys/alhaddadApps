import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';

class AppStokisTerdekatCard extends StatelessWidget {
  final String title;
  final String? alamat;
  final String? status;
  final String? distance;
  final VoidCallback onGoogleMapsTapped;
  final VoidCallback onWazeTapped;

  AppStokisTerdekatCard({
    required this.title,
    this.alamat,
    this.status,
    this.distance,
    required this.onGoogleMapsTapped,
    required this.onWazeTapped,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(16.0),
        margin: EdgeInsets.only(bottom: 8.0),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: secondaryColor,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        alamat!.capitalizeFirstofEach,
                        style: TextStyle(
                          color: lightColor,
                        ),
                      ),
                      SizedBox(height: 5.0),
                    ],
                  ),
                ),
                InkWell(
                  onTap: onGoogleMapsTapped,
                  child: Image.asset(
                    'assets/images/google_maps.png',
                    width: 30.0,
                  ),
                ),
                SizedBox(width: 5.0),
                InkWell(
                  onTap: onWazeTapped,
                  child: Image.asset(
                    'assets/images/waze.png',
                    width: 30.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: AppSize.mainEnd,
              children: [
                TextManrope(text: '${distance!}KM'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

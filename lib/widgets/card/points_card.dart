import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';

class PointsCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String points;
  final Function() onTap;

  const PointsCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.points,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          width: AppSize.widthScreen(context) * 0.6,
          height: 900,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              // mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: AppSize.widthScreen(context) * 0.5,
                  height: AppSize.heightScreen(context) * 0.2,
                  // margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                        color: Colors.black.withOpacity(0.5),
                      )
                    // color: Colors.blueAccent,
                  ),
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: AppSize.widthScreen(context) * 0.55,
                          child: Text(
                            title,
                            maxLines: 2,
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Text(
                          subtitle,
                          style: TextStyle(
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: points,
                                style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: ' points',
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

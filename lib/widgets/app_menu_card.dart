import 'package:apps_al_haddad/al_haddad.dart';
import 'package:flutter/material.dart';

class AppMenuCard extends StatelessWidget {
  final String? image;
  final String title;
  final String subtitle;
  final Color colors;
  final Function() onTap;

  const AppMenuCard({
     this.image,
    required this.title,
    required this.subtitle,
    required this.colors,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    colors,
                    colors.withOpacity(0.5),
                    // Colors.white.withOpacity(0.5),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextManrope(
                          text: '$title',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),TextManrope(
                          text: '$subtitle',
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                          color: Colors.black,
                        ),

                      ],
                    ),
                    Icon(Icons.arrow_forward_ios_outlined)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 5,),
          // Divider(thickness: 1.0, color: Colors.black,),
        ],
      ),
    );
  }
}

import 'package:apps_al_haddad/al_haddad.dart';
import 'package:flutter/material.dart';

class AppsHomeMenuCard extends StatelessWidget {
  final String? menuName;
  final String amaunData;
  final IconData? icons;
  final Color colors;
  final Function()? onTap;

  const AppsHomeMenuCard(
      {this.menuName,
      this.amaunData = 'RM0.00',
      this.icons,
      this.onTap,
      required this.colors,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(colors);
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              colors,
              colors.withOpacity(0.5),
              Colors.white,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              topLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10)),
        ),
        child: Container(
          width: AppSize.widthScreen(context),
          height: 100,
          // height: AppSize.heightScreen(context),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      icons,
                      size: 25,
                      color: colors,
                    ),
                  ),
                ),
              ),
              Container(
                  // color: Colors.blue,
                  width: AppSize.widthScreen(context) * 0.55,
                  child: Container(
                    padding: EdgeInsets.only(left: 8.0),
                    // alignment: Alignment.center,
                    child: TextManrope(
                      text: menuName!,
                      maxLines: 2,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.left,
                    ),
                  )),
              if (amaunData != null)
                Container(
                    // color: Colors.blue,
                    width: AppSize.widthScreen(context) * 0.55,
                    child: Container(
                      padding: EdgeInsets.only(left: 8.0),
                      // alignment: Alignment.center,
                      child: TextManrope(
                        text: amaunData ?? 'RM0.00',
                        maxLines: 2,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.left,
                        fontSize: 28,
                      ),

                      // Text(
                      //   amaunData!,
                      //   maxLines: 2,
                      //   style: TextStyle(fontWeight: FontWeight.bold),
                      // ),
                    )),
            ],
          ),
        ),
      ),
    );
  }
}

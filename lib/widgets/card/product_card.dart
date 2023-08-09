import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String? price;
  final Function() onTap;

  const ProductCard({
    Key? key,
    required this.title,
    this.price,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        // mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: AppSize.widthScreen(context) * 0.5,
            height: AppSize.heightScreen(context) * 0.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10)),
                image: DecorationImage(
                  image: NetworkImage(imageURl + image),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: Colors.black.withOpacity(0.5),
                )
                // color: Colors.blueAccent,
                ),
          ),
          Container(
            width: AppSize.widthScreen(context) * 0.5,
            decoration: BoxDecoration(
              color: primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                border: Border.all(
                  color: Colors.black.withOpacity(0.5),
                )
                // color: Colors.blueAccent,
                ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextManrope(
                text: title,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

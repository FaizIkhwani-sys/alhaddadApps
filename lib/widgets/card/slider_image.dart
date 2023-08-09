import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';

class SliderImage extends StatelessWidget {
  final String image;

  const SliderImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.widthScreen(context),
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
        ),
        color: grayColor,
        borderRadius: BorderRadius.circular(6.0),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:apps_al_haddad/al_haddad.dart';

class AppUploadField extends StatelessWidget {
  final String? label;
  final String? title;
  final Function()? onTap;
  final String? errorText;

  AppUploadField({
    this.label,
    this.title,
    this.onTap,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!label.isNullOrWhiteSpace) ...[
          TextManrope(
            text: label ?? '',
            color: labelTextColor,
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 8.0),
        ],
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(8.0),
            width: AppSize.widthScreen(context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xff38b000),
                  child: Icon(
                    EvaIcons.downloadOutline,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 16.0),
                TextManrope(
                  text: title ?? '',
                  color: labelTextColor,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 6.0),
        if (!errorText.isNullOrWhiteSpace)
          Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: TextManrope(
                text: errorText!,
                color: Colors.red,
                fontSize: 12.0,
              )),
      ],
    );
  }
}

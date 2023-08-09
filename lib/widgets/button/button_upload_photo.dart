import 'package:flutter/material.dart';

Widget buttonUploadPhoto(title, icon, color, onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 35,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.black54,
            ),
          )
        ],
      ),
    ),
  );
}

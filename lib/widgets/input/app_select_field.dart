import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:apps_al_haddad/al_haddad.dart';

class AppSelectField extends StatelessWidget {
  final String? label;
  final dynamic value;
  final double width;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final String hint;
  final VoidCallback? onTap;
  final bool readOnly;
  final ValueChanged<dynamic>? onSubmitted;
  final ValueChanged<dynamic>? onSaveFunction;
  final ValueChanged<dynamic> onChange;
  final FocusNode? focusNode;
  final String? errorText;
  final Color borderColor;
  final double borderWidth;
  final List<DropdownMenuItem<dynamic>> items;

  const AppSelectField({
    this.value,
    required this.items,
    this.label,
    this.onSaveFunction,
    required this.onChange,
    this.focusNode,
    this.onSubmitted,
    this.width = 300,
    this.margin = const EdgeInsets.symmetric(vertical: 4),
    this.padding = const EdgeInsets.symmetric(horizontal: 0),
    this.hint = '',
    this.onTap,
    this.readOnly = false,
    this.errorText,
    this.borderColor = Colors.grey,
    this.borderWidth = 1,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.circular(15.0);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label ?? '',
          style: const TextStyle(
            color: labelTextColor,
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: AppSize.spaceX8),
        DropdownButtonFormField(
          hint: Text(
            hint,
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
          isExpanded: true,
          value: value,
          items: items,
          onTap: () => FocusScope.of(context).unfocus(),
          onChanged: onChange,
          onSaved: onSaveFunction,
          decoration: InputDecoration(
            filled: true,
            fillColor: lightColor,
            errorText: errorText,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 16.0,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: const BorderSide(
                color: lightColor,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: const BorderSide(
                color: lightColor,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: const BorderSide(
                color: lightColor,
                width: 1,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: const BorderSide(
                color: dangerColor,
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: const BorderSide(
                color: dangerColor,
                width: 1,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}

DropdownMenuItem appDropDownMenuItem(String itemValue, dynamic value) {
  return DropdownMenuItem(
    child: Text(
      itemValue.toLowerCase().capitalizeFirstofEach,
      style: const TextStyle(
        color: darkColor,
        fontSize: 14.0,
      ),
    ),
    value: value,
  );
}

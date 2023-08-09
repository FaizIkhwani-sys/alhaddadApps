import 'package:flutter/material.dart';

import 'package:apps_al_haddad/al_haddad.dart';

class AppTextField extends StatefulWidget {
  final String? label;
  final TextInputAction textInputAction;
  final TextEditingController? controller;
  final String? initialValue;
  final double width;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final String hint;
  final int maxLine;
  final int minLine;
  final TextInputType keyboardType;
  final Widget? icon;
  final Widget? prefixIcon;
  final Function? onTap;
  final bool readOnly;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onSaveFunction;
  final ValueChanged<String>? onChange;
  final FocusNode? focusNode;
  final String? errorText;
  final bool isPassword;
  final TextAlign textAlign;
  final Color borderColor;
  final double borderWidth;
  final List<TextInputFormatter>? inputFormatter;
  final bool enabled;
  final Function? onTextFieldTap;
  final int? maxLength;
  final bool expands;

  const AppTextField({
    this.label,
    this.textInputAction = TextInputAction.done,
    this.controller,
    this.initialValue,
    this.width = 300,
    this.margin = const EdgeInsets.symmetric(vertical: 4),
    this.padding = const EdgeInsets.symmetric(horizontal: 0),
    this.hint = '',
    this.maxLine = 1,
    this.minLine = 1,
    this.keyboardType = TextInputType.text,
    this.icon,
    this.prefixIcon,
    this.onTap,
    this.readOnly = false,
    this.onSubmitted,
    this.onSaveFunction,
    this.onChange,
    this.focusNode,
    this.errorText,
    this.isPassword = false,
    this.textAlign = TextAlign.center,
    this.borderColor = Colors.grey,
    this.borderWidth = 1,
    this.inputFormatter,
    this.enabled = true,
    this.onTextFieldTap,
    this.maxLength,
    this.expands = false,
    Key? key,
  }) : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool show = true;
  BorderRadius borderRadius = BorderRadius.circular(15.0);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!widget.label.isNullOrWhiteSpace) ...[
          Text(
            widget.label ?? '',
            style: const TextStyle(
              color: labelTextColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: AppSize.spaceX8),
        ],
        TextFormField(
          key: widget.key,
          initialValue: widget.initialValue,
          focusNode: widget.focusNode,
          controller: widget.controller,
          maxLength: widget.maxLength,
          onTap: () => widget.onTextFieldTap,
          obscureText: widget.isPassword ? show : false,
          enabled: widget.enabled,
          onChanged: widget.onChange,
          onSaved: (value) => widget.onSaveFunction,
          onFieldSubmitted: widget.onSubmitted,
          keyboardType: widget.keyboardType,
          inputFormatters: widget.inputFormatter,
          expands: widget.expands,
          maxLines: widget.maxLine,
          minLines: widget.minLine,
          style: TextStyle(
            color: widget.enabled ? darkColor : grayColor,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: lightColor,
            hintText: widget.hint,
            counterText: '',
            enabled: widget.enabled,
            errorText: widget.errorText,
            errorMaxLines: 3,
            hintStyle: const TextStyle(fontSize: 14.0),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 18.0,
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
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      show ? EvaIcons.eye : EvaIcons.eyeOff,
                    ),
                    onPressed: () {
                      setState(() {
                        show = !show;
                      });
                    })
                : null,
          ),
        ),
        SizedBox(height: AppSize.spaceX16),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../base/base_stateful_widget.dart';
import '../../resources/color_constants.dart';
import '../../resources/image_resources.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final String hint;
  final String? label;
  final int max;
  final bool isEnabled;
  final Widget? suffixIcon;
  final int? maxLines;
  final String regex;
  final bool textInCaps;
  final Function? onValueChanged;
  final bool allowSmileys;
  final bool showSiffix;
  final Widget? prefixIcon;
  final bool isFilled;
  final bool isAllCapsEnabled;
  final bool onlyDigits;
  final String? errorText;
  final FocusNode? textControllerFocusNode;
  final TextAlign textAlign;
  final double borderRadius;
  final double fontSize;
  final Color filledColor;
  final Color borderColor;
  final Color focusedColor;
  final Color? textColor;

  const TextFieldWidget({
    required this.controller,
    required this.hint,
    this.label,
    this.textInputType = TextInputType.text,
    this.max = 30,
    this.borderRadius = 30,
    this.fontSize = 14,
    this.textColor,
    this.isEnabled = true,
    this.showSiffix = false,
    this.suffixIcon,
    this.regex = '',
    this.maxLines = 1,
    this.textInCaps = false,
    this.allowSmileys = false,
    this.onValueChanged,
    this.prefixIcon,
    this.errorText,
    this.isFilled = false,
    this.isAllCapsEnabled = false,
    this.onlyDigits = false,
    this.filledColor = ColorConstants.darkBackground2,
    this.borderColor = ColorConstants.textColor2,
    this.focusedColor = ColorConstants.appColor,
    this.textAlign = TextAlign.start,
    this.textControllerFocusNode,
    super.key,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends BaseStatefulWidgetState<TextFieldWidget> {
  @override
  void initState() {
    super.initState();
    if (widget.showSiffix) {
      _textControllerListener();
    }
  }

  void _textControllerListener() {
    widget.controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: widget.textControllerFocusNode,
      controller: widget.controller,
      keyboardType: widget.textInputType,
      enabled: widget.isEnabled,
      cursorColor: ColorConstants.appColor,
      style: TextStyle(
        fontSize: widget.fontSize,
        color: widget.isEnabled
            ? widget.textColor ?? (isDarkTheme() ? Colors.white : Colors.black)
            : ColorConstants.disabledColor,
        letterSpacing: 1.0,
      ),
      onChanged: (String value) {
        if (widget.onValueChanged != null) {
          widget.onValueChanged!(value);
        }
      },
      textCapitalization: widget.textInCaps ? TextCapitalization.sentences : TextCapitalization.none,
      maxLength: widget.max,
      maxLines: widget.maxLines,
      textAlign: widget.textAlign,
      inputFormatters: widget.regex.isEmpty
          ? widget.allowSmileys
                ? <TextInputFormatter>[]
                : <TextInputFormatter>[
                    if (widget.onlyDigits) ...[FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                    if (widget.textInCaps) ...<TextInputFormatter>[UpperCaseTextFormatter()],
                    FilteringTextInputFormatter.deny(
                      RegExp(
                        r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])',
                      ),
                    ),
                  ]
          : <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(widget.regex)),
              if (widget.textInCaps) ...<TextInputFormatter>[UpperCaseTextFormatter()],
              if (!widget.allowSmileys) ...<TextInputFormatter>[
                FilteringTextInputFormatter.deny(
                  RegExp(
                    r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])',
                  ),
                ),
              ],
            ],
      decoration: setInputDecoration(),
    );
  }

  InputDecoration setInputDecoration() {
    return widget.prefixIcon != null
        ? InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(width: 1, color: widget.borderColor),
            ),
            hintMaxLines: 2,
            prefixIcon: widget.prefixIcon,
            /*suffixIcon: widget.suffixIcon,*/
            labelText: widget.label != null ? null : widget.hint,
            hintText: widget.label,
            counterText: "",
            labelStyle: const TextStyle(
              color: ColorConstants.textColor3,
              overflow: TextOverflow.visible,
            ),
            isDense: true,
            fillColor: widget.filledColor,
            filled: true,
            alignLabelWithHint: true,
            focusColor: ColorConstants.appColor,
            errorText: widget.errorText,
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorConstants.red),
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
            suffixIconConstraints: const BoxConstraints(minHeight: 20, minWidth: 20),
            suffixIcon: widget.showSiffix
                ? widget.controller.value.text.isNotEmpty
                      ? GestureDetector(
                          onTap: () {
                            widget.controller.clear();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Image.asset(
                              ImageResources.closeIcon,
                              height: 10,
                              color: isDarkTheme() ? ColorConstants.white : ColorConstants.textColor0,
                            ),
                          ),
                        )
                      : null
                : null,
            hintStyle: TextStyle(fontSize: widget.fontSize, color: ColorConstants.textColor1),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.focusedColor),
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(color: widget.borderColor),
            ),
            errorStyle: const TextStyle(color: ColorConstants.red),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(color: widget.borderColor),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          )
        : InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(width: 1, color: widget.borderColor),
            ),
            /*prefixIcon: prefixIcon ?? const SizedBox(width: 0,),*/
            /*suffixIcon: widget.suffixIcon,*/
            labelStyle: const TextStyle(
              color: ColorConstants.textColor3,
              overflow: TextOverflow.visible,
            ),
            labelText: widget.label != null ? null : widget.hint,
            hintText: widget.label,
            hintMaxLines: 2,
            //hintText: hint,
            counterText: "",
            suffixIconConstraints: const BoxConstraints(minHeight: 20, minWidth: 20),
            suffixIcon: widget.showSiffix
                ? widget.controller.value.text.isNotEmpty
                      ? GestureDetector(
                          onTap: () {
                            widget.controller.clear();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Image.asset(
                              ImageResources.closeIcon,
                              height: 10,
                              color: isDarkTheme() ? ColorConstants.white : ColorConstants.textColor0,
                            ),
                          ),
                        )
                      : null
                : null,
            fillColor: widget.filledColor,
            filled: widget.isFilled,
            errorStyle: const TextStyle(color: ColorConstants.red),
            errorText: widget.errorText,
            focusColor: ColorConstants.appColor,
            isDense: true,
            alignLabelWithHint: true,
            hintStyle: TextStyle(fontSize: widget.fontSize, color: ColorConstants.textColor1),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.focusedColor /*ColorConstants.appColor*/),
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorConstants.red),
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(color: widget.borderColor),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(color: widget.borderColor),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(text: newValue.text.toUpperCase(), selection: newValue.selection);
  }
}

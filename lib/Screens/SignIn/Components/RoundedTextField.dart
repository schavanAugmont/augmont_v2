import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../Utils/colors.dart';

import '../../../Utils/strings.dart';
import 'TextFieldContainer.dart';

class RoundedTextField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final TextInputType keyboardType;
  final FormFieldValidator validator;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final bool isEnabled;
  final String hint;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final VoidCallback? onTap;
  final Widget? suffix;
  final Color? color;

  const RoundedTextField({
    Key? key,
    required this.onChanged,
    required this.keyboardType,
    required this.validator,
    required this.controller,
    required this.inputFormatters,
    required this.isEnabled,
    required this.hint,
    this.maxLength,
    this.textInputAction = TextInputAction.done,
    this.textCapitalization = TextCapitalization.none,
    this.onTap,
    this.suffix,
    this.color = primaryTextColor,
  }) : super(key: key);

  @override
  State<RoundedTextField> createState() => _RoundedTextFieldState();
}

class _RoundedTextFieldState extends State<RoundedTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: TextFormField(
       //
        // enableInteractiveSelection: widget.isEnabled,
        onTap: widget.onTap,
        enabled: widget.isEnabled,
        controller: widget.controller,
        readOnly: !widget.isEnabled,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
        textAlign: TextAlign.start,
        maxLines: 1,
        maxLength: widget.maxLength,
        onChanged: widget.onChanged,
        validator: widget.validator,
        textCapitalization: widget.textCapitalization,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 0.5, //<-- SEE HERE
              color: primaryColor,
            ),
          ),
          counterText: "",
          hintText: widget.hint,
          suffix: widget.suffix,
          hintStyle: TextStyle(
            fontFamily: Strings.fontFamilyName,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: primaryTextColor,
          )
        ),
        style: TextStyle(
          fontFamily: Strings.fontFamilyName,
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: primaryTextColor,
        ),
        textInputAction: widget.textInputAction,
      ),
    );
  }
}

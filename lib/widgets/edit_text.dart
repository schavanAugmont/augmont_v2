import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/Utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditText extends StatelessWidget {
  final TextEditingController controller;
  final TextCapitalization textCapitalization;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final String hint;
  final String label;
  final bool isRequired;
  final bool isDropDown;
  final Function(String value)? onChanged;
  final VoidCallback? onTap;
  final List<TextInputFormatter> formatter;
  final int? maxLength;
  final int? maxLines;

  const EditText({
    super.key,
    required this.controller,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.none,
    this.textInputType = TextInputType.text,
    this.hint = "",
    this.label = '',
    this.isRequired = false,
    this.isDropDown = false,
    this.onChanged,
    this.formatter = const [],
    this.onTap,
    this.maxLength,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(label.isNotEmpty)
         Row(
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
             Text(label,style: CustomTheme.style(weight: FontWeight.w500)),
             const SizedBox(width: 2),
             if(isRequired)Text("*",style: CustomTheme.style(size: 16,color: Colors.red,weight: FontWeight.w600),)
           ],
         ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: EdgeInsets.only(top: label.isNotEmpty?8:0),
            decoration: BoxDecoration(
              color: lightColor,
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onTap: onTap,
                    readOnly: isDropDown,
                    controller: controller,
                    textCapitalization: textCapitalization,
                    textInputAction: textInputAction,
                    keyboardType: textInputType,
                    inputFormatters: formatter,
                    onChanged: onChanged,
                    maxLength: maxLength,
                    minLines: 1,
                    maxLines: maxLines,
                    style: CustomTheme.style(size: 14,weight: FontWeight.w600),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      hintText: hint,
                      hintStyle: CustomTheme.style(size: 14,weight: FontWeight.w500,color: Colors.grey),
                      counterText: "",
                    ),
                  ),
                ),
                if(isDropDown)
                const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black26),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

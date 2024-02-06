import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../Utils/colors.dart';

class OtpView extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextInputType keyboardType;
  final FormFieldValidator validator;
  final TextEditingController controller;

  const OtpView({
    Key? key,
    required this.controller,
    required this.onChanged,
    required this.keyboardType,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      enabled: true,
      enablePinAutofill: true,
      appContext: context,
      validator: validator,
      controller: controller,
      onChanged: onChanged,
      cursorColor: primaryColor,
      enableActiveFill: true,
      keyboardType: keyboardType,
      animationType: AnimationType.none,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      length: 4,
      obscureText: false,
      autoDisposeControllers: false,
      boxShadows: const [
        BoxShadow(
          offset: Offset(0, 0),
          color: brownGreyColor,
          blurRadius: 1,
        )
      ],
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(10),
        borderWidth: 1,
        fieldHeight: 55,
        fieldWidth: 60,
        activeColor: divider,
        activeFillColor: white,
        inactiveColor: white,
        inactiveFillColor: white,
        selectedColor: white,
        selectedFillColor: white,
      ),
      textStyle: const TextStyle(
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: primaryTextColor,
      ),
    );
  }
}

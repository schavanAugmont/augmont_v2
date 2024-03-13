import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../Utils/colors.dart';
import '../../../Utils/strings.dart';

class OtpView extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final int otpLength;
  final bool isobscureText;
  final TextInputType keyboardType;
  final FormFieldValidator validator;
  final TextEditingController controller;
  final bool isError;

  const OtpView({
    Key? key,
    required this.controller,
    required this.otpLength,
    required this.isobscureText,
    required this.onChanged,
    required this.keyboardType,
    required this.validator, required this.isError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return PinCodeTextField(
    //   enabled: true,
    //   enablePinAutofill: true,
    //   appContext: context,
    //   validator: validator,
    //   controller: controller,
    //   onChanged: onChanged,
    //   cursorColor: primaryColor,
    //   enableActiveFill: true,
    //   keyboardType: keyboardType,
    //   animationType: AnimationType.none,
    //   inputFormatters: <TextInputFormatter>[
    //     FilteringTextInputFormatter.digitsOnly
    //   ],
    //   length: 4,
    //   obscureText: false,
    //   autoDisposeControllers: false,
    //   boxShadows: const [
    //     BoxShadow(
    //       offset: Offset(0, 0),
    //       color: brownGreyColor,
    //       blurRadius: 1,
    //     )
    //   ],
    //   pinTheme: PinTheme(
    //     shape: PinCodeFieldShape.box,
    //     borderRadius: BorderRadius.circular(10),
    //     borderWidth: 1,
    //     fieldHeight: 55,
    //     fieldWidth: 60,
    //     activeColor: divider,
    //     activeFillColor: white,
    //     inactiveColor: white,
    //     inactiveFillColor: white,
    //     selectedColor: white,
    //     selectedFillColor: white,
    //   ),
    //   textStyle: const TextStyle(
    //     fontFamily: 'Gilroy',
    //     fontWeight: FontWeight.bold,
    //     fontSize: 14,
    //     color: primaryTextColor,
    //   ),
    // );


    return PinCodeTextField(
          enabled: true,
          autoDisposeControllers: false,
          enablePinAutofill: true,
          appContext: context,
          length: otpLength,
          validator: validator,
          obscureText: isobscureText,
          enableActiveFill: true,
          animationType: AnimationType.none,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          textStyle: TextStyle(
            fontFamily: Strings.fontFamilyName,
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: primaryTextColor,
          ),
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.underline,
            fieldHeight: 50,
            fieldWidth: 40,
            activeFillColor: Colors.white,
            activeColor: Colors.black,
            inactiveColor: Colors.black,
            inactiveFillColor: Colors.white,
            selectedColor: divider,
            selectedFillColor: Colors.white,
          ),
          cursorColor: Colors.black,
          animationDuration: const Duration(milliseconds: 300),
          // errorAnimationController: errorController,
          controller: controller,
          keyboardType: TextInputType.number,

          onChanged:onChanged,
        );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Utils/colors.dart';
import '../Utils/session_manager.dart';
import '../Utils/strings.dart';

class PdfPasswordDialog extends StatefulWidget {
  const PdfPasswordDialog({Key? key}) : super(key: key);

  @override
  State<PdfPasswordDialog> createState() => _PdfPasswordDialogState();
}

class _PdfPasswordDialogState extends State<PdfPasswordDialog> {

  final _passwordController=TextEditingController();
  var error = ''.obs;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async=>true,
      child: Dialog(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0)
          ),
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Password Protected",
                style: TextStyle(
                  fontFamily: Strings.fontFamilyName,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: bottomNavigationColor,
                ),
              ),
              const SizedBox(height: 16,),
              Text(
                "Enter the password to open this PDF File.",
                style: TextStyle(
                  fontFamily: Strings.fontFamilyName,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: primaryTextColor,
                ),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                width: double.maxFinite,
                child: TextField(
                  controller: _passwordController,
                  maxLength: 4,
                  maxLines: 1,
                  keyboardType: const TextInputType.numberWithOptions(),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    counterText: "",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:const BorderSide(width: 0.5,color: secondaryTextColor),
                    ),
                    isDense: true,
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Align(
                alignment: Alignment.centerLeft,
                child: Obx(
                      () => error.isEmpty
                      ? const SizedBox()
                      : Text(
                    error.value,
                    style: TextStyle(
                      fontFamily: Strings.fontFamilyName,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: redColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Text(
                "Note : Use last 4 digit of your mobile number to open PDF.",
                style: TextStyle(
                  fontFamily: Strings.fontFamilyName,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: primaryTextColor,
                ),
              ),

              const SizedBox(height: 16,),

              SizedBox(
                height: 40,
                width: context.width*.60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          textStyle:  TextStyle(
                            fontFamily: Strings.fontFamilyName,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: white,
                          ),
                        ),
                        onPressed: () {
                          Get.back(result: 'close');
                        },
                        child: const Text("Close"),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          textStyle:  TextStyle(
                            fontFamily: Strings.fontFamilyName,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: white,
                          ),
                        ),
                        onPressed: () async{
                          String mobile = await SessionManager.getMobileNumber();
                          String password  = mobile.substring(mobile.length-4);
                          if(_passwordController.text.trim().isEmpty){
                            error("Required field");
                          }else if(password!=_passwordController.text){
                            error("Invalid password");
                          }else{
                            Get.back(result: _passwordController.text);
                          }
                        },
                        child: const Text("OPEN"),
                      ),
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

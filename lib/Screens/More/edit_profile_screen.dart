import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../Utils/colors.dart';
import '../../Utils/strings.dart';
import '../../controllers/editprofile_controller.dart';
import '../SignIn/Components/RoundedTextField.dart';
import '../SignIn/Components/SignInComponents.dart';
import '../SignIn/Components/TextFieldContainer.dart';


class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _EditProfileState();
  }
}

class _EditProfileState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(builder: (controller) {
      return PopScope(
          canPop: false, //It should be false to work
          onPopInvoked: (didPop) {
            if (didPop) {
              return;
            }
            controller.onBack();
          },
          child: SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  centerTitle: false,
                  titleSpacing: 0.0,
                  leading: IconButton(
                    onPressed: () {
                      controller.onBack();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 16,
                    ),
                    //replace with our own icon data.
                  ),
                  title: Transform(
                    // you can forcefully translate values left side using Transform
                      transform: Matrix4.translationValues(-15.0, 0.0, 0.0),
                      child: Text('Profile',
                          style: TextStyle(
                            color: primaryTextColor,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ))),
                ),
                bottomNavigationBar: Container(
                    height: 55,
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    // Adjust padding as needed
                    child: ElevatedButton(
                        onPressed: () {

                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 55.0),
                            backgroundColor: Colors.black),
                        child: Text("Update Profile",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            )))),
                body: SingleChildScrollView(
                  child: Container(margin:EdgeInsets.all(20),child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Center(child: SizedBox(
                        height: 80,
                        width: 80,
                        child: Stack(
                          clipBehavior: Clip.none,
                          fit: StackFit.expand,
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4'),

                            ),
                            Positioned(
                                bottom: -10,
                                right: -35,

                                child: RawMaterialButton(
                                  onPressed: () {},
                                  elevation: 2.0,
                                  fillColor: Color(0xFFF5F6F9),
                                  child: Icon(Icons.camera_alt_outlined, color: Colors.blue,size: 15,),
                                  padding: EdgeInsets.all(5.0),
                                  shape: CircleBorder(),
                                )),
                          ],
                        ),
                      ),),
                      SizedBox(
                        height: 30,
                      ),
                      subtitle1(Strings.firstName),
                      const SizedBox(
                        height: 10,
                      ),
                      RoundedTextField(
                        onChanged: (value) {
                          // controller.isFirstNameError(value.isEmpty);
                          // controller.update();
                        },
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          return null;
                        },
                        controller: controller.firstNameController,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]")),
                        ],
                        isEnabled: true,
                        hint: Strings.enterFirstName,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      if (controller.isFirstNameError.value)
                        Text(
                          Strings.fieldRequired,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            fontFamily: Strings.fontFamilyName,
                          ),
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      subtitle1(Strings.lastName),
                      const SizedBox(
                        height: 10,
                      ),
                      RoundedTextField(
                        onChanged: (value) {
                          // controller.isFirstNameError(value.isEmpty);
                          // controller.update();
                        },
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          return null;
                        },
                        controller: controller.lastNameController,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]")),
                        ],
                        isEnabled: true,
                        hint: Strings.enterLastName,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      if (controller.isLastNameError.value)
                        Text(
                          Strings.fieldRequired,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            fontFamily: Strings.fontFamilyName,
                          ),
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      subtitle1(Strings.mobileNumber),
                      const SizedBox(
                        height: 10,
                      ),
                      RoundedTextField(
                        onChanged: (value) {
                          // controller.isFirstNameError(value.isEmpty);
                          // controller.update();
                        },
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          return null;
                        },
                        controller: controller.mobileController,
                        inputFormatters: <TextInputFormatter>[],
                        isEnabled: false,
                        hint: Strings.enterMobileNumber,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      subtitle1(Strings.emailId),
                      const SizedBox(
                        height: 10,
                      ),
                      RoundedTextField(
                        onChanged: (value) {
                          // controller.isFirstNameError(value.isEmpty);
                          // controller.update();
                        },
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          return null;
                        },
                        controller: controller.emailController,
                        inputFormatters: <TextInputFormatter>[],
                        isEnabled: true,
                        hint: Strings.enterEmailId,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      if (controller.isEmailError.value)
                        Text(
                          Strings.emailInvalid,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            fontFamily: Strings.fontFamilyName,
                          ),
                        ),
                      SizedBox(
                        height: 10,
                      ),

                      subtitle1(Strings.gender),
                      const SizedBox(
                        height: 10,
                      ),

                      TextFieldContainer(
                          child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                  isExpanded: true,
                        value: controller.gendervalue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: controller.genderList.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items,style: TextStyle(
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: primaryTextColor,
                            ),),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            controller.gendervalue = newValue!;
                          });
                        },
                              ))),
                      const SizedBox(
                        height: 10,
                      ),
                      subtitle1(Strings.dateOfBirth),

                      const SizedBox(
                        height: 10,
                      ),
                      RoundedTextField(
                        onChanged: (value) {
                          // controller.isFirstNameError(value.isEmpty);
                          // controller.update();
                        },
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          return null;
                        },
                        controller: controller.dobController,
                        inputFormatters: const [],
                        onTap: () {
                          controller.selectDateOfBirth(context);
                        },
                        hint: Strings.enterDateOfBirth,
                        textInputAction: TextInputAction.next,
                        isEnabled: true,
                        suffix: Icon(Icons.calendar_month,color: Colors.black,),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      if (controller.isPANError.value)
                        Text(
                          controller.dobController.text.isEmpty
                              ? Strings.fieldRequired
                              : controller.dobErrorMessage.value,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            fontFamily: Strings.fontFamilyName,
                          ),
                        ),
                    ],
                  ),),
                ),
              )));
    });
  }





}

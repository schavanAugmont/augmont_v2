import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/Utils/themes.dart';
import 'package:augmont_v2/controllers/address_controller.dart';
import 'package:augmont_v2/widgets/augmont_app_bar.dart';
import 'package:augmont_v2/widgets/edit_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            appBar: const AugmontAppbar(
              canBack: true,
              title: "Add New Address",
            ),
            bottomNavigationBar: Container(
              height: 70,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 0,
                    blurRadius: 12,
                    offset: Offset(0, -4),
                  )
                ]
              ),
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  foregroundColor: Colors.white,
                  fixedSize: const Size(double.maxFinite, 50),
                  shape: const RoundedRectangleBorder()
                ),
                onPressed: (){},
                child: Text("Submit",style: CustomTheme.style(size: 16,color: Colors.white,weight: FontWeight.w600)),
              )
            ),
            body: ListView(
              padding: const EdgeInsets.all(14),
              children: [
                EditText(
                  controller: controller.fullNameController,
                  textCapitalization: TextCapitalization.words,
                  hint: "Augmont",
                  label: "Full Name",
                  isRequired: true,
                  formatter: [
                    FilteringTextInputFormatter.allow(RegExp(r'[A-za-z ]'))
                  ],
                ),
                const SizedBox(height: 20),

                EditText(
                  key: UniqueKey(),
                  controller: controller.mobileController,
                  textInputType: TextInputType.number,
                  hint: "9807654321",
                  label: "Mobile Number",
                  isRequired: true,
                  maxLength: 10,
                  formatter: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9]'),),
                    FilteringTextInputFormatter.deny(RegExp('^[0-5]+')),
                  ],
                ),
                const SizedBox(height: 20),

                EditText(
                  controller: controller.address1Controller,
                  textInputType: TextInputType.streetAddress,
                  hint: "Building name",
                  label: "Address 1",
                  isRequired: true,
                ),
                const SizedBox(height: 20),

                EditText(
                  controller: controller.address2Controller,
                  hint: "Shanti nagar",
                  label: "Address 2",
                ),
                const SizedBox(height: 20),

                EditText(
                  controller: controller.address3Controller,
                  hint: "60 Feet Road",
                  label: "Address 3",
                ),
                const SizedBox(height: 20),

                EditText(
                  controller: controller.pincodeController,
                  textInputType: TextInputType.number,
                  formatter: [
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  maxLength: 6,
                  hint: "101101",
                  label: "Pincode",
                  isRequired: true,
                ),
                const SizedBox(height: 20),

                EditText(
                  controller: controller.stateController,
                  hint: "Maharashtra",
                  label: "State",
                  isRequired: true,
                  isDropDown: true,
                  onTap: () {
                    controller.onSelectState();
                  },
                ),
                const SizedBox(height: 20),

                EditText(
                  controller: controller.cityController,
                  hint: "Mumbai",
                  label: "City",
                  isRequired: true,
                  isDropDown: true,
                  onTap: () {
                    controller.onSelectCity();
                  },
                ),
                const SizedBox(height: 20),

                Obx(
                  ()=> Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black87,width: 1),
                    ),
                    child: Row(
                      children: [
                        Checkbox(
                          value: controller.isDefault.value,
                          activeColor: primaryTextColor,
                          onChanged: (value) {
                            controller.isDefault(value);
                          },
                        ),
                        Text("Set this as my default address",style: CustomTheme.style(size: 12,weight: FontWeight.w600),)
                      ],
                    ),
                  ),
                )

              ],
            ),
          ),
        );
      },
    );
  }
}

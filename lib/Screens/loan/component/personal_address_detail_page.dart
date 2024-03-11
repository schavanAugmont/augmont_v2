import 'package:augmont_v2/Utils/extension_util.dart';
import 'package:augmont_v2/Utils/themes.dart';
import 'package:augmont_v2/controllers/loan_process_controller.dart';
import 'package:augmont_v2/widgets/edit_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PersonalAddressDetailPage extends StatelessWidget {
  const PersonalAddressDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoanProcessController>(
      builder: (controller) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text("Personal details",style: CustomTheme.style(weight: FontWeight.w600),),
                subtitle: Text("Edit your personal details",style: CustomTheme.style(size: 10),),
              ),
              EditText(
                controller: controller.fullNameController,
                label: "Full Name",
                hint: "Deepak gupta",
                isRequired: true,
              ),
              10.h,
              EditText(
                controller: controller.fullNameController,
                label: "Mobile Number",
                hint: "9087654322",
                isRequired: true,
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                title: Text("Address Details",style: CustomTheme.style(weight: FontWeight.w600),),
                subtitle: Text("Give us the address for service availability",style: CustomTheme.style(size: 10),),
              ),
              EditText(
                controller: controller.pincodeController,
                label: "Pincode",
                hint: "100101",
                isRequired: true,
                textInputType: TextInputType.number,
                maxLength: 6,
                formatter: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              10.h,
              EditText(
                controller: controller.cityController,
                label: "City",
                hint: "Thane",
                isRequired: true,
                isDropDown: true,
              ),
              10.h,
              EditText(
                controller: controller.stateController,
                label: "State",
                hint: "Maharashtra",
                isRequired: true,
                isDropDown: true,
              ),
            ],
          ),
        );
      },
    );
  }
}

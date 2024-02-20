import 'package:augmont_v2/controllers/address_controller.dart';
import 'package:augmont_v2/widgets/augmont_app_bar.dart';
import 'package:flutter/material.dart';
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
              title: "Address",
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.black87,
              child: const Icon(Icons.add,color: Colors.white,),
              onPressed: (){},
            ),
            body: ListView(
              children: [],
            ),
          ),
        );
      },
    );
  }
}

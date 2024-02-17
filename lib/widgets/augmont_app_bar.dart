import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/Utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utils/strings.dart';

class AugmontAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool canBack;
  final List<Widget> actions;

  const AugmontAppbar({super.key, this.title = '', this.canBack = true, this.actions = const []});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      height: preferredSize.height,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        color: white,
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            spreadRadius: 0,
            color: Colors.black12,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Row(
        children: [
          if (canBack)
            IconButton(
              onPressed: Get.back,
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87, size: 20),
            ),
          if (!canBack)
            const SizedBox(width: 16,),
          Text(
            title,
            style: TextStyle(color: priceTextColor, fontWeight: FontWeight.w600, fontSize: 15, fontFamily: Strings.fontFamilyName),
          ),
          const Spacer(),
          ...actions,
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

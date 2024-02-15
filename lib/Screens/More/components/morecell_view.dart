import 'package:flutter/material.dart';

import '../../../Utils/colors.dart';
import '../../../Utils/strings.dart';
class MoreCellView extends StatelessWidget {
  final String iconImg;
  final String title;
  final VoidCallback onPressed;
  final bool isLast;

  const MoreCellView(
      {Key? key,
      required this.title,
      required this.iconImg,
      required this.onPressed,
      required this.isLast})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: onPressed,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    iconImg,
                    color: primaryTextColor,
                    width: 25,
                    height: 25,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w600,
                        color: primaryTextColor,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (!isLast)
          Container(
            margin: const EdgeInsets.only(top: 15),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Divider(
              height: 1,
              thickness: 1,
              color: brownGreyColor,
            ),
          ),
      ],
    );
  }
}

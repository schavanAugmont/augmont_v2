import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/colors.dart';

class HeaderWalletView extends StatelessWidget {
  final String walletAmount;

  final bool isShowHeader;
  final bool isLoggedIn;
  final bool isThankYou;

  final VoidCallback onPressed;

  final bool isAddId;

  const HeaderWalletView({
    Key? key,
    required this.walletAmount,
    this.isShowHeader = false,
    this.isLoggedIn = true,
    required this.onPressed,
    this.isAddId = true,
    this.isThankYou = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isShowHeader)
            IconButton(
              padding: const EdgeInsets.symmetric(vertical: 20),
              icon: const Icon(
                Icons.arrow_back_outlined,
                color: primaryColor,
              ),
              onPressed: onPressed,
            ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  height: 50,
                  child: Image.asset('assets/images/logo.png'),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          'assets/images/ic_bell.png',
                          width: 20,
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          'assets/images/ic_gift.png',
                          width: 20,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

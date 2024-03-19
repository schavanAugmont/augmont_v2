import 'package:augmont_v2/Utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:mobile_number/mobile_number.dart';

import 'colors.dart';

class MobileSelectionPopup extends StatefulWidget {
  List<SimCard> simCard;
  final CallBack callBack;
  final CloseCallBack closecallBack;
  MobileSelectionPopup(
      {Key? key, required this.simCard, required this.callBack,required this.closecallBack})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MobileSelectionPopup();
  }
}

typedef CallBack = void Function(String mobile);

typedef CloseCallBack = void Function();

class _MobileSelectionPopup extends State<MobileSelectionPopup> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Continue with",
              style: TextStyle(
                fontFamily: Strings.fontFamilyName,
                fontWeight: FontWeight.w400,
                color: primaryTextColor,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ListView.separated(
                shrinkWrap: true,
                //MUST TO ADDED
                physics: NeverScrollableScrollPhysics(),
                //MUST TO ADDED
                itemCount: widget.simCard.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {
                      widget.callBack(widget.simCard[i].number.toString());
                      //Navigator.of(context).pop();
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          child: Icon(
                            Icons.phone,
                            size: 20,
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.grey[300]),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(widget.simCard[i].number.toString()),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, i) {
                  return Divider();
                },
              ),

            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
               widget.closecallBack();
              },
              child: Text(
                "NONE OF THE ABOVE",
                style: TextStyle(
                  fontFamily: Strings.fontFamilyName,
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                  fontSize: 12,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

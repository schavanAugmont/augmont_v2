import 'package:flutter/material.dart';


class ShopScreen extends StatefulWidget{
  const ShopScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ShopScreenState();
  }
}

class _ShopScreenState extends State<ShopScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          body: GestureDetector(
            onTap: () async {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Text("Shop Screen"),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
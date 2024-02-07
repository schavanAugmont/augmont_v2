import 'package:flutter/material.dart';


class ExchangeScreen extends StatefulWidget{
  const ExchangeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExchangeScreenState();
  }
}

class _ExchangeScreenState extends State<ExchangeScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          body: GestureDetector(
            onTap: () async {
              FocusScope.of(context).unfocus();
            },
            child:  Container(
              height: MediaQuery.of(context).size.height,
              child:Center(
                child: Text("Exchange Screen"),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
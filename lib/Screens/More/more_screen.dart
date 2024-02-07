import 'package:flutter/material.dart';


class MoreScreen extends StatefulWidget{
  const MoreScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MoreScreenState();
  }
}

class _MoreScreenState extends State<MoreScreen>{
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
              child:Center(
                child: Text("More Screen"),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
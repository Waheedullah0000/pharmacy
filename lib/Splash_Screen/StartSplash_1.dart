import 'dart:async';
import 'package:flutter/material.dart';

import 'Splash_2.dart';

class StartSplash1 extends StatefulWidget {
  const StartSplash1({super.key});

  @override
  State<StartSplash1> createState() => _StartSplash1State();
}

class _StartSplash1State extends State<StartSplash1> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomeScreen(),));
    });
  }
  //
  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF19839A),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/image.png",
              width: sizeWidth*0.60,height: sizeHeight*0.60),
        ],
      ),)
    );
  }
}

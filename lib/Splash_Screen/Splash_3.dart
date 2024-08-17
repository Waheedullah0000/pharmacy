import 'package:doctor_pharmacy/SignIn_Screen/Sign%20Up_Screen(1).dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../Login_Screen/log_In__(1).dart';

class Splash_3 extends StatefulWidget {
  const Splash_3({super.key});

  @override
  State<Splash_3> createState() => _Splash_3State();
}

class _Splash_3State extends State<Splash_3> {
  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset('assets/smallStickrer.png',height: sizeHeight*0.35,width:sizeWidth*0.35,)
            Container(
              height: sizeHeight*0.35,
              width: sizeWidth*0.35,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/smallStickrer.png")),
              ),
            ),
            SizedBox(height: sizeHeight*0.01,),
            Text('Let’s get started!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
            SizedBox(height: sizeHeight*0.01,),
            Text("Login to enjoy the features we’ve"),
            Text('provided, and stay healthy!'),
            SizedBox(height: sizeHeight*0.06,),
            ///LogIn Button
            Usefull_button(sizeHeight: sizeHeight, title: 'Login', onpress: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => LogIn(),));
            },),
            SizedBox(height: sizeHeight*0.03,),
            ///Sign Up Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 08),
              child: Container(
                height: sizeHeight*0.07,
                width: double.maxFinite,
                child:
                TextButton(onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Sign_In(),) );
                },child: Text('Sign Up',style: TextStyle(color:Color(0xFF19839A) ),),),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF19839A),),
                  borderRadius: BorderRadius.circular(40),
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Usefull_button extends StatefulWidget {
  final String title;
  final Function() onpress;
  const Usefull_button({

    super.key,
    required this.sizeHeight, required this.title, required this.onpress,
  });

  final double sizeHeight;

  @override
  State<Usefull_button> createState() => _Usefull_buttonState();
}

class _Usefull_buttonState extends State<Usefull_button> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 08),
      child: Container(
        height: widget.sizeHeight*0.07,
        width: double.maxFinite,
        child: TextButton(onPressed: widget.onpress,child: Text(widget.title,style: TextStyle(color: Colors.white),),),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF19839A),),
          borderRadius: BorderRadius.circular(40),
          color: Color(0xFF19839A),
        ),

      ),
    );
  }
}

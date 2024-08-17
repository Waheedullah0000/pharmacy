import 'package:doctor_pharmacy/Splash_Screen/Splash_Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Splash_3.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectindex = 0;
  PageController controller =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 1);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  static List<forPageVew> pagevew = [
    forPageVew(
        imagess: "assets/doctor1.png",
        title: 'Consult only with a doctor',
        subtitle: 'you trust'),
    forPageVew(
        imagess: 'assets/doctor2.png',
        title: 'Find a lot of specialist',
        subtitle: 'doctors in one place'),
    forPageVew(
        imagess: 'assets/doctor3.png',
        title: 'Get connect our Online',
        subtitle: 'Consultation'),
  ];

  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:Colors.white ,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => Splash_3(),));
            },
            child: const Text('SKIP'),
          ),
           SizedBox(
            width: sizeWidth*0.01,
          )
        ],
      ),
      body: OrientationBuilder(
        builder: (context, orientation) => Stack(
          children: [
            /// image
            SizedBox(
              height: sizeHeight,
              width: double.infinity,
              child: PageView.builder(
              controller: controller,
              onPageChanged: (i) => setState(() =>selectindex = i),
              itemCount: pagevew.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: sizeHeight*0.68,
                      width: orientation == Orientation.portrait ?double.infinity: 400,
                      decoration:  BoxDecoration(
                          image: DecorationImage(
                              image:  AssetImage( pagevew[index].imagess),
                              fit: orientation == Orientation.portrait ? BoxFit.contain: BoxFit.fill)),
                    ),
                  ],
                );
              },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: orientation == Orientation.portrait ? sizeHeight * 0.22 : 110,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Colors.grey.shade100,
                          Colors.white],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter
                    ),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(pagevew[selectindex].title,style: const TextStyle(fontWeight: FontWeight.bold),),
                    Text(pagevew[selectindex].subtitle,style: const TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: orientation == Orientation.portrait ? sizeHeight*0.050 :0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ...List.generate(pagevew.length, (index) =>
                                  AnimatedContainer(
                                    duration: const Duration(microseconds: 300),
                                    curve: Curves.bounceIn,
                                    margin: const EdgeInsets.only(right: 8),
                                    height: 5,
                                    width: selectindex==index?12:12,
                                    decoration: BoxDecoration(
                                      color: selectindex==index? const Color(0xFF14697B):const Color(0xFF199A8E),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  )
                              ),
                            ],
                          ),
                          IconButton(onPressed: (){
                            if(selectindex==pagevew.length-1){
                              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const Splash_3(),));
                            }else{
                            controller.animateToPage(selectindex+1, duration: const Duration(milliseconds: 300), curve: Curves.ease);}
                          }, icon:const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 23,
                                backgroundColor: Color(0xFF19839A),
                                child: Icon(Icons.arrow_forward_rounded,color: Colors.white,),
                              )
                            ],
                          )
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

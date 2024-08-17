import 'package:doctor_pharmacy/HomePage/appoinmentScreen.dart';
import 'package:doctor_pharmacy/HomePage/doctor_Detail_monthDayButton.dart';
import 'package:doctor_pharmacy/HomePage/Doctor_Entity/doctor_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import '../widget/custom_checkbox.dart';

class DoctorDetailScreen extends StatefulWidget {
  final DoctorEntity? getDataDetail;

  const DoctorDetailScreen(
      {super.key, getDoctorDetail, this.getDataDetail});

  @override
  State<DoctorDetailScreen> createState() => _DoctorDetailScreenState();
}

class _DoctorDetailScreenState extends State<DoctorDetailScreen> {

  @override
  Widget build(BuildContext context) {
    var sizeHight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text("Doctor Details"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: sizeHight * 0.17,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              widget.getDataDetail!.image!,
                              height: sizeHight * 0.15,
                              width: sizeWidth * 0.30,
                              fit: BoxFit.fill,
                            )),
                        SizedBox(
                          width: sizeWidth * 0.05,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "Dr. ${widget.getDataDetail!.doctorName!}",
                              fontSize: 20.0,
                              fontWeight: FontWeight.w100,
                            ),
                            CustomText(
                                text: widget.getDataDetail!.doctorSkills!,
                                color: Colors.grey.shade400),
                            SizedBox(
                              height: sizeHight * 0.001,
                            ),
                            Container(
                                height: sizeHight * 0.03,
                                width: sizeWidth * 0.11,
                                decoration: const BoxDecoration(
                                    color: Color(0xffE8F3F1)),
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 18,
                                    ),
                                    Text(
                                      '4,7',
                                      style: TextStyle(fontSize: 12),
                                    )
                                  ],
                                )),
                            SizedBox(
                              height: sizeHight * 0.001,
                            ),
                            Row(
                              children: [
                                SizedBox(height: sizeHight * 0.03),
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                                const Text(
                                  '800m away',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: sizeHight * 0.04,
                  ),
                  const CustomText(text: 'About',color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,
                  ),
                   ReadMoreText(
                    widget.getDataDetail!.aboutForDoctor!,
                    trimMode: TrimMode.Line,
                    trimLines: 2,
                   moreStyle: const TextStyle(color: Colors.blue),
                   lessStyle: const TextStyle(color: Colors.blue),
                   trimCollapsedText: 'Read More',
                    trimExpandedText: "Read Less",
                  ),
                  ///
                  SizedBox(
                    height: sizeHight * 0.04,
                  ),
                  const ButtonGridScreen(),
                  SizedBox(
                    height: sizeHight * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: sizeHight*0.07,
                        width: sizeWidth*0.19,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffE8F3F1),
                        ),
                        child: const Icon(CupertinoIcons.chat_bubble,size: 30,),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Appoinment_Screen(getDataAppoinment:widget.getDataDetail),));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: sizeHight*0.07,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xff19839A),
                            ),
                            child: Text('Book Apointment',style: TextStyle(
                              color: Colors.white
                            ),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}

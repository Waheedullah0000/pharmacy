import 'package:doctor_pharmacy/HomePage/Doctor_Entity/doctor_entity.dart';
import 'package:doctor_pharmacy/chat_with_doctor/chat_with_doctor.dart';
import 'package:doctor_pharmacy/chat_with_doctor/searchingScreen.dart';
import 'package:doctor_pharmacy/widget/custom_checkbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Appoinment_Screen extends StatefulWidget {
  final DoctorEntity? getDataAppoinment;

  const Appoinment_Screen({super.key, this.getDataAppoinment});

  @override
  State<Appoinment_Screen> createState() => _Appoinment_ScreenState();
}

class _Appoinment_ScreenState extends State<Appoinment_Screen> {
  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.white),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black)),
          title: const Text(
            'Appointment',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: double.maxFinite,
                    //width: sizeWidth * 0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border:
                          Border.all(color: const Color(0xffE8F3F1), width: 2),
                    ),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  widget.getDataAppoinment!.image!,
                                  height: sizeHeight * 0.15,
                                  width: sizeWidth * 0.25,
                                  fit: BoxFit.cover,
                                )),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Dr. Marcus Horizon",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 14),
                                ),
                                const Text(
                                  "Cardiologist",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(height: sizeHeight * 0.02),
                                Container(
                                    height: sizeHeight * 0.03,
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
                                Row(
                                  children: [
                                    SizedBox(height: sizeHeight * 0.03),
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: sizeHeight * 0.05,
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 1),
                        color: Colors.grey.shade200,
                        // spreadRadius: 5,                      // Spread radius
                        //  blurRadius: 7,
                      )
                    ]),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomText(
                              text: "Date",
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                            ),
                            CustomText(
                              text: "Change",
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade400,
                            )
                          ],
                        ),
                        SizedBox(
                          height: sizeHeight * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: sizeHeight * 0.07,
                              width: sizeHeight * 0.10,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffE8F3F1),
                              ),
                              child: const Icon(
                                Icons.calendar_month,
                                size: 30,
                                color: Color(0xFF19839A),
                              ),
                            ),
                            const CustomText(
                              text: "Wednesday, Jun 23, 2021 | 10:00 AM",
                              color: Colors.black87,
                            )
                          ],
                        ),
                        SizedBox(
                          height: sizeHeight * 0.03,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: sizeHeight * 0.03,
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 1),
                          color: Colors.grey.shade200
                          // spreadRadius: 5,                      // Spread radius
                          //  blurRadius: 7,
                          )
                    ]),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomText(
                              text: "Reason",
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                            ),
                            CustomText(
                              text: "Change",
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade400,
                            )
                          ],
                        ),
                        SizedBox(
                          height: sizeHeight * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: sizeHeight * 0.07,
                              width: sizeHeight * 0.10,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffE8F3F1),
                              ),
                              child: const Icon(
                                  CupertinoIcons.pencil_ellipsis_rectangle,
                                  size: 30,
                                  color: Color(0xFF19839A)),
                            ),
                            SizedBox(
                              width: sizeWidth * 0.04,
                            ),
                            const CustomText(
                              text: "Chest pain",
                              color: Colors.black,
                              fontSize: 17,
                            )
                          ],
                        ),
                        SizedBox(
                          height: sizeHeight * 0.03,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: sizeHeight * 0.03,
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 1),
                        color: Colors.grey.shade200,
                      )
                    ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                          text: "Payment Detail",
                          fontSize: 19,
                        ),
                        SizedBox(
                          height: sizeHeight * 0.01,
                        ),
                        const RowCustom(
                          textStart: 'Consultation',
                          textEnd: '\$60.00',
                        ),
                        SizedBox(
                          height: sizeHeight * 0.01,
                        ),
                        const RowCustom(
                          textStart: 'Admin Fee',
                          textEnd: '\$01.00',
                        ),
                        SizedBox(
                          height: sizeHeight * 0.01,
                        ),
                        const RowCustom(
                          textStart: 'Additional Discount',
                          textEnd: '-',
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(fontSize: 17),
                            ),
                            Text('\$61.00',
                                style: TextStyle(
                                    fontSize: 17, color: Color(0xFF19839A))),
                          ],
                        ),
                        SizedBox(
                          height: sizeHeight * 0.03,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: sizeHeight * 0.03,
                  ),
                  const CustomText(
                    text: "Payment Method",
                    fontSize: 19,
                  ),
                  SizedBox(
                    height: sizeHeight * 0.03,
                  ),
                  Container(
                    height: sizeHeight * 0.08,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'VISA',
                            style: TextStyle(
                                fontSize: 19, color: Color(0xFF1A1F71)),
                          ),
                          Text('Change',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey.shade400)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: sizeHeight * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'Total',
                            fontSize: 17,
                            color: Colors.grey.shade400,
                          ),
                          const CustomText(
                            text: '\$ 61.00',
                            fontSize: 22,
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          //////////////// booking button
                          _showDialog(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: sizeHeight * 0.07,
                          width: sizeWidth * 0.50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xff19839A),
                          ),
                          child: const Text(
                            'Booking',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(16.0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.20,
                width: MediaQuery.of(context).size.width * 0.39,
                decoration: const BoxDecoration(
                    color: Color(0xffE8F3F1),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(
                      "assets/icons/check_Icon.png",
                    ))),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              const CustomText(
                text: "Payment Success",
                fontSize: 25,
                fontWeight: FontWeight.w100,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              const CustomText(
                text: "Your payment has been successful",
                fontSize: 13,
              ),
              const CustomText(
                text: "You have been consultation session",
                fontSize: 13,
              ),
              const CustomText(
                text: "with your trusted doctor",
                fontSize: 13,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SearchingScreen(getData: widget.getDataAppoinment!),
                      ));
                  // Navigator.of(context).pop(); // Close the dialog
                  // Add your chat doctor functionality here
                },
                color: const Color(0xFF19839A),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: const CustomText(
                  text: 'Chat Doctor',
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class RowCustom extends StatelessWidget {
  final String? textStart;
  final String? textEnd;
  const RowCustom({super.key, this.textStart, this.textEnd});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: textStart.toString(),
          color: Colors.grey.shade400,
          fontSize: 17,
        ),
        CustomText(
          text: textEnd.toString(),
          fontSize: 17,
        )
      ],
    );
  }
}

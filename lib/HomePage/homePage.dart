import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_pharmacy/HomePage/Doctor_Entity/doctor_entity.dart';
import 'package:doctor_pharmacy/HomePage/doctor_Detail.dart';
import 'package:doctor_pharmacy/Login_Screen/log_In__(1).dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'top doctor.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.transparent,
        height: sizeHeight * 0.10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.home,
                  size: 35,
                  color: Colors.grey,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.email,
                  size: 35,
                  color: Colors.grey,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.compass_calibration,
                  size: 35,
                  color: Colors.grey,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person_rounded,
                  size: 35,
                  color: Colors.grey,
                )),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Find your desire \nhealt solution",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LogIn(),
                          ));
                    },
                    icon: const Icon(
                      CupertinoIcons.bell,
                      color: Colors.black,
                      size: 25,
                    ),
                  )
                ],
              ),
              SizedBox(height: sizeHeight * 0.04),
              TextFormField(
                controller: _searchController,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 20),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey.shade400,
                    ),
                    hintText: 'Search doctor, drugs, articles...',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          color: Colors.grey.shade200,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          color: Colors.grey.shade200,
                        )),
                    filled: true,
                    fillColor: const Color(0xffFBFBFB)),
              ),
              // SizedBox(height: sizeHeight * 0.01),
              Expanded(
                child: SingleChildScrollView(
                  child: StreamBuilder(
                      stream: DoctorEntity.collection().snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.hasError || snapshot.data!.docs.isEmpty) {
                          return const Center(
                            child: Text('No found doctor'),
                          );
                        }
                        ;
                        return Column(
                          children: [
                            SizedBox(
                              height: sizeHeight * 0.04,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _multiImagesWithText(
                                  text: 'Doctor',
                                  onTap: () {},
                                  image: const AssetImage(
                                      'assets/icons/Doctor.png'),
                                ),
                                _multiImagesWithText(
                                  text: 'Pharmacy',
                                  onTap: () {},
                                  image: const AssetImage(
                                      'assets/icons/Pharmacy.png'),
                                ),
                                _multiImagesWithText(
                                  text: 'Hospital',
                                  onTap: () {},
                                  image: const AssetImage(
                                      'assets/icons/Hospital.png'),
                                ),
                                _multiImagesWithText(
                                  text: 'Ambulance',
                                  onTap: () {},
                                  image: const AssetImage(
                                      'assets/icons/Ambulance.png'),
                                ),
                              ],
                            ),
                            SizedBox(height: sizeHeight * 0.04),
                            Container(
                              height: sizeHeight * 0.2,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: const Color(0xffE8F3F1),
                                  image: const DecorationImage(
                                      image: AssetImage('assets/girlImg.png'),
                                      alignment: Alignment.centerRight)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Early protection for \nyour family health",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: sizeHeight * 0.01),
                                    MaterialButton(
                                      onPressed: () {},
                                      color: const Color(0xff19839A),
                                      shape: ContinuousRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: const Text(
                                        'Learn more',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Top Doctor',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Top_Doctor(),
                                        ));
                                  },
                                  child: const Text(
                                    'See all',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: sizeHeight * 0.37,
                              width: double.infinity,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  DoctorEntity doctorData =
                                      snapshot.data!.docs[index].data();

                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DoctorDetailScreen(
                                                    getDataDetail: doctorData),
                                          ));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 8),
                                      child: Container(
                                        width: sizeWidth * 0.45,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                                color: const Color(0xffE8F3F1),
                                                width: 2)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                  height: sizeHeight * 0.03),
                                              Center(
                                                  child: CircleAvatar(
                                                      backgroundImage:
                                                          NetworkImage(
                                                              doctorData
                                                                  .image!),
                                                      radius: 50)),
                                              SizedBox(
                                                  height: sizeHeight * 0.05),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    doctorData.doctorName!,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        fontSize: 14),
                                                  ),
                                                  Text(
                                                    doctorData.doctorSkills!,
                                                    style: const TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                      height: sizeHeight * 0.03,
                                                      width: sizeWidth * 0.11,
                                                      decoration:
                                                          const BoxDecoration(
                                                              color: Color(
                                                                  0xffE8F3F1)),
                                                      child: const Row(
                                                        children: [
                                                          Icon(
                                                            Icons.star,
                                                            size: 18,
                                                          ),
                                                          Text(
                                                            '4,7',
                                                            style: TextStyle(
                                                                fontSize: 12),
                                                          )
                                                        ],
                                                      )),
                                                  SizedBox(
                                                      width: sizeWidth * 0.03),
                                                  const Icon(
                                                    Icons.location_on,
                                                    color: Colors.grey,
                                                    size: 20,
                                                  ),
                                                  const Text(
                                                    '800m away',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 12),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: sizeHeight * 0.00),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Health article",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: const Text("See all",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)))
                              ],
                            ),
                            SizedBox(height: sizeHeight * 0.01),
                            Container(
                              height: sizeHeight * 0.2,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: const LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Colors.blue,
                                        Colors.green,
                                        Colors.teal,
                                        Colors.lightBlue
                                      ])),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Special for Health Article",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: sizeHeight * 0.01),
                          ],
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _multiImagesWithText({required text, required image, onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: image, scale: 1.5),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade100,
                    blurRadius: 10,
                    spreadRadius: 1)
              ]),
        ),
        const SizedBox(height: 10),
        Text(
          text,
          style: const TextStyle(
            color: Colors.grey,
          ),
        )
      ],
    ),
  );
}

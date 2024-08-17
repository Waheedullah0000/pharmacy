import 'package:doctor_pharmacy/HomePage/Doctor_Entity/doctor_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'doctor_Detail.dart';

class Top_Doctor extends StatefulWidget {
  const Top_Doctor({super.key});

  @override
  State<Top_Doctor> createState() => _Top_DoctorState();
}

class _Top_DoctorState extends State<Top_Doctor> {
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
          'Top Doctor',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, color: Colors.black),
          )
        ],
      ),
      body: StreamBuilder(
        stream: DoctorEntity.collection().snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
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
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DoctorEntity doctorGetData =
                        snapshot.data!.docs[index].data();
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DoctorDetailScreen(
                                getDataDetail: doctorGetData,
                              ),
                            ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 08, vertical: 08),
                        child: Container(
                          width: sizeWidth * 0.45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                color: const Color(0xffE8F3F1), width: 2),
                          ),
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        doctorGetData.image!,
                                        height: sizeHeight * 0.15,
                                        width: sizeWidth * 0.25,
                                        fit: BoxFit.cover,
                                      )),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Dr. ${doctorGetData.doctorName}",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      Text(
                                        doctorGetData.doctorSkills!,
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
                                                color: Colors.grey,
                                                fontSize: 12),
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
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

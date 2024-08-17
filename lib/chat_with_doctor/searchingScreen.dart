import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_pharmacy/HomePage/Doctor_Entity/doctor_entity.dart';
import 'package:doctor_pharmacy/chat_with_doctor/chat_with_doctor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SearchingScreen extends StatefulWidget {
  final DoctorEntity getData;
  const SearchingScreen({super.key, required this.getData});

  @override
  State<SearchingScreen> createState() => _SearchingScreenState();
}

class _SearchingScreenState extends State<SearchingScreen> {
  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1,$user2";
    } else {
      return "$user2,$user1";
    }
  }

  bool isLoading = false;
  final TextEditingController _search = TextEditingController();
  List<Map<String, dynamic>> userMap = [];

  void onSearch() async {
    String searchText = _search.text.trim().toLowerCase();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    setState(() {
      isLoading = true;
    });
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('userEntity')
          .where('name', isGreaterThanOrEqualTo: searchText)
          .where('name', isLessThanOrEqualTo: searchText + '\uf8ff')
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        setState(() {
          userMap = querySnapshot.docs
              .map((doc) => doc.data() as Map<String, dynamic>)
              .toList();
        });
      } else {
        setState(() {
          userMap = [];
        });
        Fluttertoast.showToast(msg: 'No users found, try again');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black)),
        title: Text(
          widget.getData.doctorName!,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.videocam, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, color: Colors.black),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CupertinoSearchTextField(
              onSubmitted: (value) {
                onSearch();
              },
              controller: _search,
            ),
            const SizedBox(height: 10),
            isLoading
                ? const LinearProgressIndicator()
                : TextButton(
                    onPressed: onSearch,
                    child: const Text('Search'),
                  ),
            Expanded(
              child: ListView.builder(
                itemCount: userMap.length,
                itemBuilder: (context, index) {
                  final user = userMap[index];
                  return ListTile(
                    onTap: () {
                      String roomId = chatRoomId(
                        FirebaseAuth.instance.currentUser?.displayName ??
                            "UnknownUser",
                        user['name'],
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatWithDoctor(
                            userMap: user,
                            chatRoomId: roomId,
                          ),
                        ),
                      );
                    },
                    leading: const Icon(
                      Icons.account_box_rounded,
                      size: 35,
                    ),
                    title: Text(user['name'] ?? "No name"),
                    subtitle: Text(user['email'] ?? "No email"),
                    trailing: const Icon(Icons.chat),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

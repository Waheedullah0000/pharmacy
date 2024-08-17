import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class VideoCallScreen extends StatefulWidget {
  final String callingId;
  final Map<String, dynamic> currentuser;

  VideoCallScreen({
    super.key,
    required this.callingId,
    required this.currentuser,
  });

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final user = FirebaseAuth.instance.currentUser;

  late String userId;
  late String userName;

  @override
  void initState() {
    super.initState();
    userId = user != null ? user!.uid : Random().nextInt(10000).toString();
    userName = user != null ? widget.currentuser["name"] : "Guest $userId";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: ZegoUIKitPrebuiltCall(
            userName: userName,
            appSign:
                '36842837243a284cf838bd56c113744cbc67ce2ce0f84322551bb95e1f83aa3b',
            callID: widget.callingId,
            appID: 1251592028,
            userID: userId,
            config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
          ),
        ),
      ),
    );
  }
}

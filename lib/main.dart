import 'package:doctor_pharmacy/test_package.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'Audio_Vedio_Call/video_Call.dart';
import 'Forgot_Password_Screen/forgot_Password_Screen(1).dart';
import 'HomePage/homePage.dart';
import 'Login_Screen/log_In__(1).dart';
import 'Splash_Screen/StartSplash_1.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(debugShowCheckedModeBanner: false, home: checkUser());
  }

  Widget checkUser() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return const HomePageScreen();
    } else {
      return const LogIn();
    }
  }
}

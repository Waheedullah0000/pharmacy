import 'package:doctor_pharmacy/HomePage/homePage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Instantiate GoogleSignInHelper
    final AuthService googleSignInHelper = AuthService();

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                googleSignInHelper.handleSignIn();
              },
              child: const Text("Google Sign-In"),
            ),
          ],
        ),
      ),
    );
  }
}
///Google class
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> handleSignIn() async {
    try {
      // Initialize GoogleSignIn
      await _googleSignIn.signIn();

      GoogleSignInAccount? googleUser = _googleSignIn.currentUser;

      if (googleUser != null) {
        GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken
        );

        await _auth.signInWithCredential(credential);
      }
    } catch (e) {
      print("Error signing in with Google: $e");
    }
  }
}


class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Instantiate GoogleSignInHelper
    final AuthService googleSignInHelper = AuthService();

    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, AsyncSnapshot<User?> snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(color: Colors.white,),);
          }
          if (snapshot.hasData){
            return _showAlertDialogClass(
              title: "Yeay! Welcome Back",
              subtitle: "Once again you login successfully",
              trailing: "into medidoc app",
              buttonName: "go to home",
              onpress: (){
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const HomePageScreen(),));
              },
            );
          }
          else {
            return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        googleSignInHelper.handleSignIn();
                      },
                      child: const Text("Google Sign-In"),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class _showAlertDialogClass extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? trailing;
  final String buttonName;
  final Function() onpress;
  const _showAlertDialogClass({super.key, required this.title, required this.subtitle,this.trailing, required this.buttonName, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      title: Image.asset('assets/icons/check_Icon.png',
        height: MediaQuery.of(context).size.height*0.15,
        width: MediaQuery.of(context).size.width*0.15,),
      actions: [

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,style: const TextStyle(fontWeight: FontWeight.w800,
                fontSize: 20),),
            Text(subtitle,style: const TextStyle(color: Colors.grey,fontSize: 13),),
            Center(child: Text(trailing??'',style: const TextStyle(color: Colors.grey,fontSize: 13),)),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.07,
              width: MediaQuery.of(context).size.width*0.50,
              decoration: BoxDecoration(
                  color: const Color(0xFF19839A),
                  borderRadius: BorderRadius.circular(40)
              ),
              child: Center(child: TextButton(onPressed: onpress, child: Text(buttonName,style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),))),
            )
          ],
        )

      ],
    );
  }
}

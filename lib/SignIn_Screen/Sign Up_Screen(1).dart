import 'package:doctor_pharmacy/Login_Screen/log_In__(1).dart';
import 'package:doctor_pharmacy/entity/user_entity.dart';
import 'package:doctor_pharmacy/widget/custom_checkbox.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:validators/validators.dart';

class Sign_In extends StatefulWidget {
  const Sign_In({super.key});

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
  final TextEditingController _nameSignInController = TextEditingController();
  final TextEditingController _emailSignInController = TextEditingController();
  final TextEditingController _passwordSignInController =
      TextEditingController();
  bool _isEmailCorrect = false;
  bool _hidden = false;
  bool _hidden2 = false;
  bool _hidden1 = false;
  bool _wrongPassword = false;
  bool _checkbox = false;
  bool isLoading = false;
  Future<void> _showAlertDialog(String title, String message) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Image.asset(
            'assets/icons/check_Icon.png',
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.15,
          ),
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Success",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                ),
                const Text(
                  "Your account has been successfully",
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
                const Center(
                    child: Text(
                  "registered",
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.50,
                  decoration: BoxDecoration(
                      color: const Color(0xFF19839A),
                      borderRadius: BorderRadius.circular(40)),
                  child: Center(
                      child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LogIn(),
                                ));
                          },
                          child: const Text(
                            'Log In',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ))),
                )
              ],
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        centerTitle: true,
        title: const Text(
          'Sign Up',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///   Name TextField
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 08),
              child: TextFormField(
                controller: _nameSignInController,
                onChanged: (value) {
                  setState(() {
                    _hidden1 = value.isNotEmpty;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  prefixIcon: Icon(Icons.person,
                      color: _hidden1 == true
                          ? const Color(0xFF19839A)
                          : Colors.grey),
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ),
            SizedBox(
              height: sizeHeight * 0.03,
            ),

            ///   Email Textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 08),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    _hidden2 = value.isNotEmpty;
                    _isEmailCorrect = isEmail(value);
                  });
                },
                controller: _emailSignInController,
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: _hidden2 == true
                        ? const Color(0xFF19839A)
                        : Colors.grey,
                  ),
                  suffixIcon: _isEmailCorrect == false
                      ? null
                      : const Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ),
            SizedBox(
              height: sizeHeight * 0.03,
            ),

            /// Password Textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 08),
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: _hidden ? false : true,
                controller: _passwordSignInController,
                onChanged: (val) {
                  setState(() {
                    _wrongPassword = val.isNotEmpty;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  prefixIcon: Icon(Icons.lock,
                      color: _wrongPassword == true
                          ? const Color(0xFF19839A)
                          : Colors.grey),
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _hidden = !_hidden;
                      });
                    },
                    icon: _hidden
                        ? const Icon(
                            FontAwesomeIcons.eye,
                            color: Colors.grey,
                          )
                        : const Icon(
                            FontAwesomeIcons.eyeSlash,
                            color: Colors.grey,
                          ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ),
            SizedBox(
              height: sizeHeight * 0.02,
            ),

            /// Checkbox Button   & Terms of Service & privacy policy
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomCheckBox(
                    onChanged: (value) {
                      setState(() {
                        _checkbox = value!;
                      });
                    },
                    value: _checkbox),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'I agree to the medidoc',
                          style: TextStyle(fontSize: 13),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            ' Terms of Service',
                            style: TextStyle(
                                color: Color(0xFF19839A), fontSize: 13),
                          ),
                        ),
                        const Text(
                          ' and',
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Privacy Policy',
                        style:
                            TextStyle(color: Color(0xFF19839A), fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: sizeHeight * 0.04,
            ),

            /// Sign Up button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 08),
              child: Container(
                height: sizeHeight * 0.07,
                width: sizeWidth,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF19839A),
                  ),
                  borderRadius: BorderRadius.circular(40),
                  color: const Color(0xFF19839A),
                ),
                child: TextButton(
                  onPressed: () async {
                    try {
                      setState(() => isLoading = true);

                      ///
                      var name = _nameSignInController.text.trim();
                      var email = _emailSignInController.text.trim();
                      var password = _passwordSignInController.text.trim();

                      ///
                      if (name.isEmpty && email.isEmpty && password.isEmpty) {
                        Fluttertoast.showToast(msg: "Please fill all field");
                        setState(() => isLoading = false);
                        return;
                      }

                      ///
                      if (name.isEmpty || email.isEmpty || password.isEmpty) {
                        if (name.isEmpty) {
                          Fluttertoast.showToast(msg: "Please enter your name");
                        } else if (email.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Please enter your email address");
                        } else {
                          Fluttertoast.showToast(
                              msg: "Please enter your password");
                        }
                        setState(() {
                          isLoading = false;
                        });
                        return; // Return to avoid further execution
                      }

                      ///
                      if (password.length < 6) {
                        Fluttertoast.showToast(
                            msg:
                                "Password must be at least 6 characters long.");
                        setState(() {
                          isLoading = false;
                        });
                        return; // Return to avoid further execution
                      }

                      ///
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .createUserWithEmailAndPassword(
                              email: email, password: password);

                      User? user = userCredential.user;

                      user?.updateProfile(displayName: name);

                      String userId = FirebaseAuth.instance.currentUser!.uid;
                      UserEntity userEntity = UserEntity(
                        userId: userId,
                        name: name,
                        email: email,
                      );

                      ///
                      await UserEntity.doc(userId: userId).set(userEntity);

                      /// If no error occurs until here, it means sign up was successful

                      _showAlertDialog('Success', 'Sign up successful!');
                      setState(() => isLoading = false);
                    } on FirebaseAuthException catch (e) {
                      setState(() => isLoading = false);
                      if (e.code == 'email-already-in-use') {
                        Fluttertoast.showToast(
                            msg: "The email address is already in use.");
                      } else if (e.code == 'weak-password') {
                        Fluttertoast.showToast(
                            msg: "The password provided is too weak.");
                      } else {
                        Fluttertoast.showToast(
                            msg: "An error occurred: ${e.message}");
                      }

                      ///
                    }
                    // await Future.delayed(const Duration(seconds: 5),(){
                    //   setState(() =>isLoading = false);
                    // });
                  },
                  child: isLoading == true
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Loading...",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: sizeWidth * 0.02,
                            ),
                            const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ],
                        )
                      : const Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ),
            ),
            SizedBox(
              height: sizeHeight * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don’t have an account?',
                  style: TextStyle(fontSize: 15),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LogIn(),
                        ));
                  },
                  child: const Text(
                    ' Sign In',
                    style: TextStyle(fontSize: 15, color: Color(0xFF19839A)),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:validators/validators.dart';

import '../Login_Screen/log_In__(1).dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  Future<void> _showAlertDialog() async {
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
                  "You have successfully reset your",
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
                const Center(
                    child: Text(
                  "password & Goto Gmail",
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
                                  builder: (context) => const LogIn(),
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

  bool _isEmailCorrect = false;

  bool isSelectedEmail = true; // Initially email button is selected

  void onEmailButtonPressed() {
    setState(() {
      isSelectedEmail = true;
    });
  }

  void onPhoneButtonPressed() {
    setState(() {
      isSelectedEmail = false;
    });
  }

  TextEditingController _emailController = TextEditingController();
  bool isLoading = false;

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
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        centerTitle: true,
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: sizeHeight * 0.03),
              const Text(
                "Forgot Your Password?",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: sizeHeight * 0.01),
              const Text(
                "Enter your email, we will send you \nconfirmation code.",
              ),
              // SizedBox(height: sizeHeight * 0.03),
              //  Container(
              //   height: sizeHeight * 0.07,
              //   width: sizeWidth,
              //   decoration: BoxDecoration(
              //     border: Border.all(
              //       color: Colors.grey.shade50,
              //     ),
              //     borderRadius: BorderRadius.circular(40),
              //     color: Colors.grey.shade100,
              //   ),
              // ),
              SizedBox(
                height: sizeHeight * 0.04,
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _isEmailCorrect = isEmail(value);
                  });
                },
                controller: _emailController,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Colors.grey.shade200,
                        )),
                    hintText: 'Enter your email',
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    prefixIcon: Icon(Icons.email_outlined,
                        color: _isEmailCorrect == false
                            ? Colors.grey
                            : const Color(0xFF19839A)),
                    suffixIcon: _isEmailCorrect == false
                        ? null
                        : const Icon(
                            Icons.check,
                            color: Color(0xFF19839A),
                          ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 15),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade100),
                        borderRadius: BorderRadius.circular(30)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Colors.grey.shade100,
                        ))
                    // enabledBorder: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(20),
                    // )
                    ),
              ),
              SizedBox(
                height: sizeHeight * 0.04,
              ),

              ///        Reset Password            /////////////////////////////////////////
              Container(
                height: sizeHeight * 0.07,
                width: sizeWidth,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF19839A),
                  ),
                  borderRadius: BorderRadius.circular(40),
                  color: const Color(0xFF19839A),
                ),

                ///Firebase.............
                child: TextButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    var email = _emailController.text.trim();
                    try {
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: email);
                      _showAlertDialog();
                      setState(() {
                        isLoading = false;
                      });
                    } catch (e) {
                      setState(() {
                        isLoading = false;
                      });
                      Fluttertoast.showToast(msg: e.toString());
                    }
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
                          'Reset Password',
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//
// class ContainerButton extends StatelessWidget {
//   final String title;
//   final bool isSelected;
//   final Function() onPress;
//
//   const ContainerButton({
//     super.key,
//     required this.title,
//     required this.isSelected,
//     required this.onPress,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPress,
//       child: Container(
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           color: isSelected ? Colors.white : Colors.grey.shade100,
//           borderRadius: BorderRadius.circular(40),
//         ),
//         child: Text(
//           title,
//           style: TextStyle(
//             color: isSelected ? const Color(0xFF19839A) : Colors.black,
//             fontSize: 16,
//           ),
//         ),
//       ),
//     );
//   }
// }
//

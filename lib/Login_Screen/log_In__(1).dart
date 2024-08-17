import 'package:doctor_pharmacy/SignIn_Screen/Sign%20Up_Screen(1).dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:validators/validators.dart';
import '../Forgot_Password_Screen/forgot_Password_Screen(1).dart';
import '../HomePage/homePage.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _hidden = false;
  bool _isEmailCorrect = false;
  bool wrongPassword = false;
  String passwordText = '';
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
                  "Yeay! Welcome Back",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                ),
                const Text("Once again you login successfully"),
                const Center(child: Text("into medidoc app")),
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
                                  builder: (context) => HomePageScreen(),
                                ));
                          },
                          child: const Text(
                            'Go to home',
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
          'Login',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///Email Textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 08),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    _isEmailCorrect = isEmail(value);
                  });
                },
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color:
                        _isEmailCorrect == false ? Colors.grey : Colors.green,
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
                  // enabledBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(20),
                  // )
                ),
              ),
            ),
            SizedBox(
              height: sizeHeight * 0.03,
            ),

            ///Password TextField
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 08),
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: _hidden ? false : true,
                controller: _passwordController,
                onChanged: (val) {
                  setState(() {
                    _isEmailCorrect = isEmail(val);
                    wrongPassword = true;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  errorText: wrongPassword
                      ? 'The password you entered is wrong'
                      : null,
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  prefixIcon: Icon(Icons.lock,
                      color: wrongPassword == false
                          ? Colors.grey
                          : Colors.redAccent.shade700),
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

            ///Text Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 08),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                    onTap: () {
                      //  Get.to(() => const Forgot_Password());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPassword(),
                          ));
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF19839A),
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: sizeHeight * 0.06,
            ),

            ///LogIn Button
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

                ///Firebase.............
                child: TextButton(
                  onPressed: () async {
                    try {
                      setState(() {
                        isLoading = true;
                        wrongPassword = true;
                      });
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim());
                      _showAlertDialog('Success', 'Login successful!');
                      _emailController.clear();
                      _passwordController.clear();
                      setState(() => isLoading = false);
                    } on FirebaseAuthException catch (e) {
                      setState(() => isLoading = false);
                      if (e.code == 'ERROR_WRONG_PASSWORD') {
                        setState(() {
                          wrongPassword = true;
                        });
                      } else {
                        setState(() {
                          passwordText = 'Please check your email';
                        });
                      }
                    }
                  },
                  child: isLoading == true
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Loading...",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: sizeWidth * 0.02,
                            ),
                            CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ],
                        )
                      : Text(
                          'Login',
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
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Sign_In(),
                          ));
                    },
                    child: const Text(
                      ' Sign Up',
                      style: TextStyle(
                        color: Color(0xFF19839A),
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: sizeHeight * 0.03,
            ),

            ///Divider
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    indent: 10,
                    endIndent: 5,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'OR',
                  style: TextStyle(color: Colors.grey),
                ),
                Expanded(
                    child: Divider(
                  thickness: 0.5,
                  indent: 5,
                  endIndent: 10,
                  color: Colors.grey,
                ))
              ],
            ),
            SizedBox(
              height: sizeHeight * 0.03,
            ),

            ///Sign in with Google
            Button_Class(
              sizeHeight: sizeHeight,
              sizeWidth: sizeWidth,
              imagess: 'assets/icons/Google.png',
              title: 'Sign in with Google',
              onpress: () {},
            ),
            SizedBox(
              height: sizeHeight * 0.03,
            ),
            //////Sign in with apple
            Button_Class(
              sizeHeight: sizeHeight,
              sizeWidth: sizeWidth,
              imagess: 'assets/icons/Apple.png',
              title: 'Sign in with Apple',
              onpress: () {},
            ),
            SizedBox(
              height: sizeHeight * 0.03,
            ),

            ///Sign in with facebook
            Button_Class(
              sizeHeight: sizeHeight,
              sizeWidth: sizeWidth,
              imagess: 'assets/icons/Facebook.png',
              title: 'Sign in with Facebook',
              onpress: () {},
            )
          ],
        ),
      ),
    );
  }
}

class Button_Class extends StatefulWidget {
  final String imagess;
  final String title;
  final Function() onpress;
  const Button_Class({
    super.key,
    required this.sizeHeight,
    required this.sizeWidth,
    required this.imagess,
    required this.title,
    required this.onpress,
  });

  final double sizeHeight;
  final double sizeWidth;

  @override
  State<Button_Class> createState() => _Button_ClassState();
}

class _Button_ClassState extends State<Button_Class> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 08),
      child: Container(
        height: widget.sizeHeight * 0.07,
        width: double.maxFinite,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade100),
          borderRadius: BorderRadius.circular(40),
        ),
        child: TextButton(
          onPressed: widget.onpress,
          child: Row(
            children: [
              Image.asset(
                widget.imagess,
                height: widget.sizeHeight * 0.03,
              ),
              SizedBox(width: widget.sizeWidth * 0.17),
              Text(
                widget.title,
                style: const TextStyle(
                    color: Color(0xFF101623), fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}

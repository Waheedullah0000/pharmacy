//
//
//
//
//
//
//
//
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:validators/validators.dart';
// import '../Login_Screen/log_In__(1).dart';
//
// class ForgotPasswordScreen extends StatefulWidget {
//   const ForgotPasswordScreen({super.key});
//
//   @override
//   State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
// }
//
// class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
//   Future<void> _showAlertDialog() async {
//     return showDialog<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Image.asset(
//             'assets/icons/check_Icon.png',
//             height: MediaQuery.of(context).size.height * 0.15,
//             width: MediaQuery.of(context).size.width * 0.15,
//           ),
//           actions: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text(
//                   "Success",
//                   style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
//                 ),
//                 const Text(
//                   "You have successfully reset your",
//                   style: TextStyle(color: Colors.grey, fontSize: 13),
//                 ),
//                 const Center(
//                   child: Text("password & Goto Gmail" ,
//                     style: TextStyle(color: Colors.grey, fontSize: 13),
//                   ),
//                 ),
//
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.03,
//                 ),
//                 Container(
//                   height: MediaQuery.of(context).size.height * 0.07,
//                   width: MediaQuery.of(context).size.width * 0.50,
//                   decoration: BoxDecoration(
//                       color: const Color(0xFF19839A),
//                       borderRadius: BorderRadius.circular(40)),
//                   child: Center(
//                       child: TextButton(
//                           onPressed: () {
//                             Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => const LogIn(),
//                                 ));
//                           },
//                           child: const Text(
//                             'Log In',
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold),
//                           ))),
//                 )
//               ],
//             )
//           ],
//         );
//       },
//     );
//   }
//
//   bool _isEmailCorrect = false;
//   final _emailController = TextEditingController();
//   final _phoneController = TextEditingController();
//   bool isLoading = false;
//   final FocusNode _emailFocusNode = FocusNode();
//   final FocusNode _phoneFocusNode = FocusNode();
//
//   @override
//   Widget build(BuildContext context) {
//     var sizeHeight = MediaQuery.of(context).size.height;
//     var sizeWidth = MediaQuery.of(context).size.width;
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(Icons.arrow_back_ios_new_outlined),
//           ),
//           centerTitle: true,
//           title: const Text(
//             'Login',
//             style: TextStyle(color: Colors.black, fontSize: 18),
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(height: sizeHeight * 0.03),
//                 const Text(
//                   "Forgot Your Password?",
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: sizeHeight * 0.01),
//                 const Text(
//                   "Enter your email or your phone number, we\nwill send you confirmation code",
//                 ),
//                 SizedBox(height: sizeHeight * 0.03),
//                 Container(
//                   height: 50,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(30),
//                       color: Colors.grey.shade100,
//                       border: Border.all(color: Colors.grey.shade100)),
//                   child: TabBar(
//                       indicatorPadding: const EdgeInsets.all(1),
//                       indicatorSize: TabBarIndicatorSize.tab,
//                       indicator: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           color: Colors.white),
//                       labelColor: const Color(0xFF19839A),
//                       dividerColor: Colors.transparent,
//                       onTap: (value) {
//                         if (value == 0) {
//                           FocusScope.of(context).requestFocus(_emailFocusNode);
//                         } else {
//                           FocusScope.of(context).requestFocus(_phoneFocusNode);
//                         }
//                       },
//                       tabs: const [
//                         Tab(
//                           text: "Email",
//                         ),
//                         Tab(
//                           text: "Phone",
//                         )
//                       ]),
//                 ),
//                 SizedBox(height: sizeHeight * 0.04),
//                 SizedBox(
//                   height: 200,
//                   width: double.infinity,
//                   child: TabBarView(children: [
//                     customEmailAndPhone(
//                       controller: _emailController,
//                       hintText: 'Enter your email',
//                       keyboardType: TextInputType.emailAddress,
//                       sizeHeight: sizeHeight,
//                       sizeWidth: sizeWidth,
//                       onPressed: () async {
//                         setState(() {
//                           isLoading = true;
//                         });
//                         var email = _emailController.text.trim();
//                         try {
//                           await FirebaseAuth.instance
//                               .sendPasswordResetEmail(email: email);
//                           // Fluttertoast.showToast(
//                           //     msg:"We have sent you email to recover password, please check email");
//                           _showAlertDialog();
//                           setState(() {
//                             isLoading = false;
//                           });
//                         } catch (e) {
//                           setState(() {
//                             isLoading = false;
//                           });
//                           Fluttertoast.showToast(msg: e.toString());
//                           if (email.isEmpty) {
//                             Fluttertoast.showToast(msg: "Please enter email");
//                             return;
//                           }
//                         }
//                       },
//                       prefixIcon: Icon(Icons.email_outlined,
//                           color: _isEmailCorrect == false
//                               ? Colors.grey
//                               : const Color(0xFF19839A)),
//                       suffixIcon: _isEmailCorrect == false
//                           ? null
//                           : const Icon(
//                         Icons.check,
//                         color: Color(0xFF19839A),
//                       ),
//                     ),
//                     customEmailAndPhone(
//                       controller: _phoneController,
//                       hintText: 'Enter your Phone',
//                       keyboardType: TextInputType.phone,
//                       sizeHeight: sizeHeight,
//                       sizeWidth: sizeWidth,
//                       onPressed: () {},
//                       prefixIcon: Icon(
//                         Icons.phone,
//                         color: _isEmailCorrect == false
//                             ? Colors.grey
//                             : const Color(0xFF19839A),
//                       ),
//                     ),
//                   ]),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget customEmailAndPhone({
//     sizeHeight,
//     sizeWidth,
//     TextInputType? keyboardType,
//     required String hintText,
//     required void Function()? onPressed,
//     Widget? prefixIcon,
//     Widget? suffixIcon,
//     TextEditingController? controller,
//   }) {
//     return Column(
//       children: [
//         TextFormField(
//           onChanged: (value) {
//             setState(() {
//               _isEmailCorrect = isEmail(value);
//             });
//           },
//           keyboardType: keyboardType,
//           controller: controller,
//           decoration: InputDecoration(
//               focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30),
//                   borderSide: BorderSide(
//                     color: Colors.grey.shade200,
//                   )),
//               hintText: hintText,
//               filled: true,
//               fillColor: Colors.grey.shade100,
//               prefixIcon: prefixIcon,
//               suffixIcon: suffixIcon,
//               contentPadding: const EdgeInsets.symmetric(vertical: 15),
//               border: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.grey.shade100),
//                   borderRadius: BorderRadius.circular(30)),
//               enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30),
//                   borderSide: BorderSide(
//                     color: Colors.grey.shade100,
//                   ))
//             // enabledBorder: OutlineInputBorder(
//             //   borderRadius: BorderRadius.circular(20),
//             // )
//           ),
//         ),
//         SizedBox(height: sizeHeight * 0.04),
//         Container(
//           height: sizeHeight * 0.07,
//           width: sizeWidth,
//           decoration: BoxDecoration(
//             border: Border.all(
//               color: const Color(0xFF19839A),
//             ),
//             borderRadius: BorderRadius.circular(40),
//             color: const Color(0xFF19839A),
//           ),
//
//           ///Firebase.............
//           child: TextButton(
//             onPressed: onPressed,
//             child: isLoading == true
//                 ? Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text(
//                   "Loading...",
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 SizedBox(
//                   width: sizeWidth * 0.02,
//                 ),
//                 const CircularProgressIndicator(
//                   color: Colors.white,
//                 ),
//               ],
//             )
//                 : const Text(
//               'Reset Password',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

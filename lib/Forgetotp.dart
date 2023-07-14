// // ignore_for_file: file_names, prefer_const_constructors, avoid_print

// import 'package:flutter/material.dart';
// import 'package:pinput/pinput.dart';

// class ForgotOptForm extends StatefulWidget {
//   const ForgotOptForm({Key? key}) : super(key: key);

//   @override
//   State<ForgotOptForm> createState() => _ForgotOptFormState();
// }

// class _ForgotOptFormState extends State<ForgotOptForm> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         scrollDirection: Axis.vertical,
//         children: [
//           SizedBox(
//             height: 20,
//           ),
//           Center(
//             child: Padding(
//               padding: const EdgeInsets.only(left: 8.0, top: 15),
//               child: Text("Phone Verifivation",
//                   style: TextStyle(
//                     color: Color(0xff58BE3F),
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                   )),
//             ),
//           ),
//           SizedBox(
//             height: 50,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 8.0, top: 8),
//             child: Text("Enter your OTP code",
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold)),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 8.0, top: 2),
//             child: Text("Enter the 6-digit code sent to you at",
//                 style: TextStyle(color: Colors.black, fontSize: 18)),
//           ),
//           Row(
//             children: const [
//               Padding(
//                 padding: EdgeInsets.only(left: 8.0),
//                 child: Text("+92 3249470845.",
//                     style: TextStyle(color: Colors.black, fontSize: 15)),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: 8.0),
//                 child: Text("did you enter the correct",
//                     style: TextStyle(
//                         color: Colors.green,
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold)),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 8.0),
//             child: GestureDetector(
//               onTap: () {
//                 Navigator.pushNamed(context, "forget");
//               },
//               child: Text("number?",
//                   style: TextStyle(
//                       color: Colors.green,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold)),
//             ),
//           ),
//           SizedBox(
//             height: 100,
//           ),
//           Pinput(
//             length: 6,
//             // defaultPinTheme: defaultPinTheme,
//             // focusedPinTheme: focusedPinTheme,
//             // submittedPinTheme: submittedPinTheme,

//             showCursor: true,
//             onCompleted: (pin) => print(pin),
//           ),
//           SizedBox(
//             height: 120,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: SizedBox(
//               width: double.infinity,
//               height: 45,
//               child: MaterialButton(
//                 textColor: Colors.white,
//                 color: Color(0xff58BE3F),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0)),
//                 child: Text(
//                   'Confirm',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 onPressed: () {
//                   Navigator.pushNamed(context, "setnew");
//                 },
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 18.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: const [
//                     Padding(
//                       padding: EdgeInsets.only(left: 8.0),
//                       child: Text("Resend Code in",
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 12,
//                             //fontWeight: FontWeight.bold
//                           )),
//                     ),
//                     Text("10 seconds",
//                         style: TextStyle(
//                           color: Colors.green,
//                           fontSize: 12,
//                           //fontWeight: FontWeight.bold
//                         )),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 8.0),
//                   child: Container(
//                     width: 30,
//                     height: 30,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.2),
//                           //color of shadow
//                         ),
//                         //you can set more BoxShadow() here
//                       ],
//                     ),
//                     child: Icon(
//                       Icons.arrow_forward_sharp,
//                       size: 18,
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

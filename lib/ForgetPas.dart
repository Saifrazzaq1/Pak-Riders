// // ignore_for_file: file_names

// import 'package:flutter/material.dart';

// class ForgetPass extends StatefulWidget {
//   const ForgetPass({Key? key}) : super(key: key);

//   @override
//   State<ForgetPass> createState() => _ForgetPassState();
// }

// class _ForgetPassState extends State<ForgetPass> {
//   TextEditingController countryController = TextEditingController();
//   var phone = "";
//   @override
//   void initState() {
//     // ignore: todo
//     // TODO: implement initState
//     countryController.text = "+92";
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: ListView(
//           scrollDirection: Axis.vertical,
//           children: [
//             const SizedBox(
//               height: 20,
//             ),
//             const Center(
//               child: Text(
//                 "Forgot Password ",
//                 style: TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xff58BE3F),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 50,
//             ),
//             const Padding(
//               padding: EdgeInsets.all(10.0),
//               child: Text(
//                 "You have a problem?",
//                 style: TextStyle(
//                   fontSize: 17,
//                   color: Color(0xff58BE3F),
//                 ),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text(
//                 "Don't Worry",
//                 style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.all(10.0),
//               child: Text(
//                 "Please Enter Phone Number to Forget your Password",
//                 style: TextStyle(
//                   fontSize: 25,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Container(
//                 height: 55,
//                 decoration: BoxDecoration(
//                     border: Border.all(width: 1, color: Colors.grey),
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     SizedBox(
//                       width: 40,
//                       child: TextField(
//                         controller: countryController,
//                         keyboardType: TextInputType.number,
//                         decoration: const InputDecoration(
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                     const Text(
//                       "|",
//                       style: TextStyle(fontSize: 33, color: Colors.grey),
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Expanded(
//                         child: TextField(
//                       onChanged: ((value) {
//                         phone = value;
//                       }),
//                       keyboardType: TextInputType.phone,
//                       decoration: const InputDecoration(
//                         border: InputBorder.none,
//                         hintText: "Phone",
//                       ),
//                     ))
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 70,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 8.0, top: 50),
//               child: Row(
//                 children: [
//                   const Text(
//                     "No problem?",
//                     style: TextStyle(
//                         fontSize: 15, color: Color.fromRGBO(36, 39, 43, 1)),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pushNamed(context, "login");
//                     },
//                     child: const Text(
//                       "Sign In ",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Color(0xff58BE3F),
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Container(
//               height: 50,
//               padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//               child: MaterialButton(
//                 textColor: Colors.white,
//                 color: const Color(0xff58BE3F),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0)),
//                 child: const Text(
//                   'Continue',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 onPressed: () {
//                   Navigator.pushNamed(context, "otp");

//                   // Navigator.pushNamed(context, "login");
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

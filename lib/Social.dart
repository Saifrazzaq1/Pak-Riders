// // ignore_for_file: file_names, sized_box_for_whitespace

// import 'package:flutter/material.dart';
// import 'package:pakriders/constants.dart';

// class Sociallogin extends StatelessWidget {
//   const Sociallogin({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: Container(
//                 height: 500,
//                 width: 300,
//                 child: Column(
//                   children: [
//                     MaterialButton(
//                       color: Colors.white,
//                       onPressed: () {},
//                       child: Row(
//                         //mainAxisAlignment: MainAxisAlignment.center,
//                         // ignore: prefer_const_literals_to_create_immutables
//                         children: [
//                           Image.network(
//                             "https://tse4.mm.bing.net/th?id=OIP.M45DMMHUpEwPeAsh9isdyAHaHa&pid=Api&P=0",
//                             height: 50,
//                             width: 50,
//                           ),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           const Text(
//                             'Continue with Google',
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold),
//                           ), // <-- Text
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     MaterialButton(
//                       color: const Color(0xff3b5998),
//                       onPressed: () {},
//                       child: Row(
//                         //mainAxisAlignment: MainAxisAlignment.center,
//                         // ignore: prefer_const_literals_to_create_immutables
//                         children: [
//                           Image.network(
//                             "https://cdn2.downdetector.com/static/uploads/c/300/f0d8e/FB-f-Logo__blue_512.png",
//                             height: 50,
//                             width: 50,
//                           ),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           const Text(
//                             'Continue with Facebook',
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold),
//                           ), // <-- Text
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     MaterialButton(
//                       color: Colors.white,
//                       onPressed: () {
//                         Get.to(LoginNum());
//                       },
//                       child: Row(
//                         //mainAxisAlignment: MainAxisAlignment.center,
//                         // ignore: prefer_const_literals_to_create_immutables
//                         children: [
//                           Icon(Icons.phone_android,
//                               size: 50, color: Colors.black),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           const Text(
//                             'Continue with Number',
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold),
//                           ), // <-- Text
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 200,
//                     ),
//                     Container(
//                       width: 300, // <-- match_parent
//                       height: 50,
//                       child: MaterialButton(
//                         textColor: Colors.white,
//                         color: const Color(0xff58BE3F),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10.0)),
//                         child: const Text(
//                           'Back',
//                           style: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.bold),
//                         ),
//                         onPressed: () {
//                           Get.to(IntroScreen());
//                         },
//                       ),
//                     ),
//                   ],
//                 )),
//           ),
//         ],
//       )),
//     );
//   }
// }

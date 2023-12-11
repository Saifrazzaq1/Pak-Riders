// // ignore_for_file: file_names, deprecated_member_use, non_constant_identifier_names

// import 'package:pakriders/constants.dart';
// import 'package:form_validator/form_validator.dart';
// import 'package:flutter/services.dart';

// class LoginNum extends StatefulWidget {
//   const LoginNum({Key? key}) : super(key: key);

//   @override
//   State<LoginNum> createState() => _LoginNumState();
// }

// class _LoginNumState extends State<LoginNum> {
//   TextEditingController countryController = TextEditingController();
//   final _formkey = GlobalKey<FormState>();
//   // ignore: non_constant_identifier_names
//   final PhonenumberController = TextEditingController();
//   bool EasyLoading = false;
//   var phone = "";
//   final auth = FirebaseAuth.instance;

//   @override
//   void initState() {
//     // ignore: todo
//     // TODO: implement initState
//     countryController.text = "+92";
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Form(
//         key: _formkey,
//         child: Container(
//           margin: const EdgeInsets.only(left: 25, right: 25),
//           alignment: Alignment.center,
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   height: 40,
//                 ),
//                 Image.asset(
//                   'images/5.JPG',
//                   width: 300,
//                   height: 200,
//                 ),
//                 const SizedBox(
//                   height: 40,
//                 ),
//                 const Text(
//                   "Phone Verification",
//                   style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const Text(
//                   "We need to register your phone without getting started!",
//                   style: TextStyle(
//                     fontSize: 16,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(
//                   height: 100,
//                 ),
//                 Container(
//                   height: 55,
//                   decoration: BoxDecoration(
//                       border: Border.all(width: 1, color: Colors.grey),
//                       borderRadius: BorderRadius.circular(10)),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       const SizedBox(
//                         width: 20,
//                         height: 50,
//                       ),
//                       SizedBox(
//                         width: 40,
//                         height: 20,
//                         child: TextFormField(
//                           controller: countryController,
//                           keyboardType: TextInputType.number,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return "Please Enter Number";
//                             }
//                             return null;
//                           },
//                           decoration: const InputDecoration(
//                             border: InputBorder.none,
//                           ),
//                         ),
//                       ),
//                       const Text(
//                         "|",
//                         style: TextStyle(fontSize: 33, color: Colors.grey),
//                       ),
//                       const SizedBox(
//                         width: 20,
//                         height: 40,
//                       ),
//                       Expanded(
//                           child: TextField(
//                         onChanged: ((value) {
//                           phone = value;
//                         }),
//                         maxLength: 10,
//                         decoration: const InputDecoration(
//                           border: InputBorder.none,
//                           hintText: "Phone",
//                         ),
//                         keyboardType: TextInputType.number,
//                         inputFormatters: <TextInputFormatter>[
//                           FilteringTextInputFormatter.digitsOnly
//                         ], // Only numbers can be entered
//                       ))
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 140,
//                 ),
//                 SizedBox(
//                   width: double.infinity,
//                   height: 45,
//                   child: ElevatedButton(
//                       // EasyLoading: EasyLoading;
//                       style: ElevatedButton.styleFrom(
//                           primary: const Color(0xff58BE3F),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10))),
//                       onPressed: () async {
//                         await FirebaseAuth.instance.verifyPhoneNumber(
//                           phoneNumber: '${countryController.text + phone}',
//                           verificationCompleted:
//                               (PhoneAuthCredential credential) {},
//                           verificationFailed: (FirebaseAuthException e) {
//                             Utils().toastMessage(e.toString());
//                           },
//                           codeSent: (String verificationId, int? resendToken) {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) =>
//                                     Verify(verificationId: verificationId),
//                               ),
//                             );
//                           },
//                           codeAutoRetrievalTimeout: (String verificationId) {
//                             Utils().toastMessage(verificationId.toString());
//                           },
//                         );
//                       },
//                       child: const Text("Send the code")),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Center(
//                       child: Text(
//                         'Login with social media?',
//                         // textAlign: TextAlign.start,
//                         style: TextStyle(fontSize: 15, color: Colors.black87),
//                       ),
//                     ),
//                     Center(
//                       child: GestureDetector(
//                         child: const Text(
//                           'Click here',
//                           //textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Color(0xff58BE3F),
//                           ),
//                         ),
//                         onTap: () {
//                           Navigator.pushNamed(context, "social");
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

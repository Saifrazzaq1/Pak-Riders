// // ignore_for_file: file_names, avoid_print, deprecated_member_use, non_constant_identifier_names, use_build_context_synchronously
// import 'constants.dart';

// class Verify extends StatefulWidget {
//   final String verificationId;
//   const Verify({Key? key,required this.verificationId}) : super(key: key);

//   @override
//   State<Verify> createState() => _VerifyState();
// }
 
// class _VerifyState extends State<Verify> {
//   final VerificationCodeController= TextEditingController();
//   //bool EasyLoading= false;
//  // var phone = "";
//   final auth =FirebaseAuth.instance;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             Icons.arrow_back_ios_rounded,
//             color: Colors.black,
//           ),
//         ),
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,

//         child: Container(
//           margin: const EdgeInsets.only(left: 25, right: 25),
//           alignment: Alignment.center,
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const SizedBox(
//                   height: 70,
//                 ),
//                 Image.asset('images/6.JPG', width: 300, height: 200),
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
//                   height: 90,
//                 ),
//                 Pinput(
//                   length: 6,

//                   // defaultPinTheme: defaultPinTheme,
//                   // focusedPinTheme: focusedPinTheme,
//                   // submittedPinTheme: submittedPinTheme,

//                   showCursor: true,
//                   onCompleted: (pin) => print(pin),
//                  controller: VerificationCodeController,
//                 ),
//                 const SizedBox(
//                   height: 130,
//                 ),
//                 SizedBox(
//                   width: double.infinity,
//                   height: 45,
//                   child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                           primary: Color(0xff58BE3F),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10))),
//                       onPressed: () async {
//                         //Navigator.pushNamed(context, "chos");

//                         final crendital= PhoneAuthProvider.credential(
//                           verificationId: widget.verificationId,
//                          smsCode:VerificationCodeController.text.toString());
//                          try{
//                            await auth.signInWithCredential(crendital);
//                            Get.to(EditProfilePage());
//                          }catch(e){

//                         Utils().toastMessage(e.toString());
//                          }
//                       },
//                       child: const Text("Verify Phone Number")),
//                 ),
//                 Row(
//                   children: [
//                     TextButton(
//                         onPressed: () {
//                           Navigator.pushNamed(
//                             context,
//                             'lognum' );
//                         },
//                         child: const Text(
//                           "Edit Phone Number ?",
//                           style: TextStyle(color: Colors.black),
//                         ))
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

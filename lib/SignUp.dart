// import 'package:pakriders/constants.dart';
// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   final _formkey = GlobalKey<FormState>();
//   bool securepass = true;
//   TextEditingController countryController = TextEditingController();
//   final TextController = TextEditingController();
//   var phone = "";
//   var number = TextEditingController();
//   var password = TextEditingController();
//   get nameController => null;

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
//         body: Form(
//       key: _formkey,
//       child: Padding(
//         padding: const EdgeInsets.all(10),
//         child: ListView(
//           children: <Widget>[
//             const SizedBox(
//               height: 60,
//             ),
//             Container(
//                 alignment: Alignment.center,
//                 padding: const EdgeInsets.all(10),
//                 child: const Text(
//                   'Sign Up',
//                   style: TextStyle(
//                       color: Color(0xff58BE3F),
//                       fontWeight: FontWeight.w500,
//                       fontSize: 30),
//                 )),
//                 SizedBox(
//                   height: 20,
//                 ),
//             Container(
//                 alignment: Alignment.center,
//                 padding: const EdgeInsets.all(10),
//                 child: const Text(
//                   'Pak Riders',
//                   style: TextStyle(fontSize: 22),
//                 )),
//             const SizedBox(
//               height: 90,
//             ),
//             Container(
//               padding: const EdgeInsets.all(10),
//               child: TextFormField(
//                 autocorrect: true,
//                 validator: (value){
//                           if(value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)){
//                               return "Enter Correct Email Address Formate: abc@mail.com";
//                           }else{
//                              return null;
//                           }
//                         },
//                 decoration: const InputDecoration(
//                   labelText: "Email",
//                   labelStyle: TextStyle(
//                     color: Color(0xff58BE3F),
//                   ), //<-- SEE HER),
//                   border: OutlineInputBorder(),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Color(0xff58BE3F),
//                     ),
//                   ),
//                 ),
//                 // keyboardType: TextInputType.number,
//                 // inputFormatters: <TextInputFormatter>[
//                 //   FilteringTextInputFormatter.digitsOnly
//                 // ], // Only numbers can be entered
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//               child: TextFormField(
//                 obscureText: true,
//                 maxLength: 8,

//                 controller: password,
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return "Please Enter Pasword";
//                   }
//                   return null;
//                 },
//                 //  obscureText: securepass,
//                 // controller: passwordController,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Color(0xff58BE3F),
//                     ),
//                   ),
//                   labelText: 'Password',
//                   labelStyle: TextStyle(
//                     color: Color(0xff58BE3F),
//                   ),
//                 ),
//               ),
//             ),
          
              
//             const SizedBox(
//               height: 140,
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
//                   'Sign Up',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 onPressed: () {
//                   if (_formkey.currentState!.validate()) {
//                     Navigator.pushNamed(context, "Login");
//                     // Utils().toastMessage(Error.);
//                   }

//                   // Navigator.pushNamed(context, "login");
//                 },
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Center(
//                   child: Text(
//                     'Login with social media or Number?',
//                     // textAlign: TextAlign.start,
//                     style: TextStyle(fontSize: 15, color: Colors.black87),
//                   ),
//                 ),
//                 Center(
//                   child: GestureDetector(
//                     child: const Text(
//                       'Click here',
//                       //textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Color(0xff58BE3F),
//                       ),
//                     ),
//                     onTap: () {
//                       Navigator.pushNamed(context, "social");
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     ));
//   }
// }
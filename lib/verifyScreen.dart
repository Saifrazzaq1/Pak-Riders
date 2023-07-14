import 'dart:async';

import 'constants.dart';

class verifyScreen extends StatefulWidget {
  
  const verifyScreen({super.key});

  @override
  State<verifyScreen> createState() => _verifyScreenState();
}

class _verifyScreenState extends State<verifyScreen> {
 
   Timer? timer;
   bool isEmailVerified= false;
   @override
   void initState(){
     isEmailVerified =FirebaseAuth.instance.currentUser!.emailVerified;
    if(!isEmailVerified){
      sendVerificationEmail();
       timer= Timer.periodic(Duration(seconds: 3), (timer) {
       checkEmailVerified();
     });
  //   user = auth.currentUser;
  //   user!.sendEmailVerification();
  // timer= Timer.periodic(Duration(seconds: 3), (timer) {
      
  //    });
    }}
       @override
  void dispose() {
   
    
    timer!.cancel();
    // TODO: implement dispose
    super.dispose();
  }
  Future<void> checkEmailVerified() async{
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {

      isEmailVerified=FirebaseAuth.instance.currentUser!.emailVerified;
    //  Get.to(Home()); 
    });
    if(isEmailVerified) timer?.cancel();
  }
     Future sendVerificationEmail() async {
   try{
  final user= FirebaseAuth.instance.currentUser!;
   await user.sendEmailVerification();} catch(e){
    Text('Error');
   }}
    

 
  @override
  Widget build(BuildContext context) => isEmailVerified 
  ? ChossScreen()
  : Scaffold(
    body: Center(child: Text('Verification Email has been sent \n Please click the link and verify'),),
  );
 
}
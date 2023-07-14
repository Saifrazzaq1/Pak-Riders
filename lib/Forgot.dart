import 'constants.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State <ForgotScreen> createState() =>  ForgotScreenState();
}

class  ForgotScreenState extends State <ForgotScreen> {
   final _formKey = GlobalKey<FormState>();
   final emailController=TextEditingController();
  String email = '';
  
 // get acs => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
          child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(

            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const SizedBox(
                height: 300,
              ),
              const Text('Forget Email',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(
                height: 60,
              ),
               // ======== Email ========
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: emailController,
                    key: const ValueKey('email'),
                   decoration: const InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(
                        color: Color(0xff58BE3F),
                        fontSize: 25,
                      ), //<-- SEE HER),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff58BE3F),
                        ),
                      ),
                    ),
                    validator: (value){
                              if(value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)){
                                  return "Enter Correct Email Address Formate: abc@mail.com";
                              }else{
                                 return null;
                              }
                            },
                    onSaved: (value) {
                      setState(() {
                        email = value!;
                      });
                    },
                  ),
                ),
                  const SizedBox(
                    height: 50,
                  ),
                   TextButton(

                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();}
                  FirebaseAuth.instance.sendPasswordResetEmail(
          email: emailController.text.trim())
    .catchError((onError) => Utils().toastMessage(onError.toString()))
    .whenComplete(() => Utils().toastMessage('Successfully Send verification email'));

        // ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: Text('Verification Link Send Successful')));


                },
                 style: TextButton.styleFrom(
                  fixedSize: Size(200, 55),
                   shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
        backgroundColor: const Color(0xff58BE3F),// Background Color
),
                child: const Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),),
      ),
    );
  }
}
import 'constants.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    setState(() {
      RefreshIndicatorState;
    });
  }

  String email = '';
  String password = '';
  String fullname = '';
  String address = '';
  bool login = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 130,
                ),
                // ======== Full Name ========
                login
                    ? Container()
                    : Column(
                        children: [
                          Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: Color(0xff58BE3F),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 30),
                              )),

                          //name
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              autocorrect: true,
                              // maxLength: 40,
                              key: const ValueKey('fullname'),
                              decoration: const InputDecoration(
                                labelText: "Full name",
                                labelStyle: TextStyle(
                                  color: Color(0xff58BE3F),
                                ), //<-- SEE HER),
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff58BE3F),
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.name,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter(
                                    RegExp(r'[a-zA-Z]+|\s'),
                                    allow: true)
                              ], // Only numbers can be entered
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Full Name';
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                setState(() {
                                  fullname = value!;
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              key: const ValueKey('Address'),
                              autocorrect: true,
                              obscureText: false,
                              //  maxLength: 8,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Enter Address";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                setState(() {
                                  address = value!;
                                });
                              },
                              decoration: const InputDecoration(
                                labelText: "Address",
                                labelStyle: TextStyle(
                                  color: Color(0xff58BE3F),
                                ), //<-- SEE HER),
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff58BE3F),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                Container(
                  child: login
                      ? const Text(
                          "Welcome Back!",
                          style: TextStyle(
                            fontSize: 30,
                            color: Color(0xff58BE3F),
                          ),
                        )
                      : null,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: login
                      ? Text(
                          "Pak Riders",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        )
                      : null,
                ),

                // SizedBox(
                //   height: 50,
                // ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    key: ValueKey('email'),
                    // controller: _emailController,
                    decoration: InputDecoration(
                      labelText: "Email",

                      labelStyle: TextStyle(
                        color: Color(0xff58BE3F),
                      ), //<-- SEE HER),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff58BE3F),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)) {
                        return "Enter Correct Email Address Formate: abc@mail.com";
                      } else {
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

                // ======== Password ========
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    key: const ValueKey('password'),
                    obscureText: true,
                    maxLength: 8,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff58BE3F),
                        ),
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Color(0xff58BE3F),
                      ),
                    ),
                    validator: (value) {
                      if (value!.length < 6) {
                        return 'Please Enter Password of min length 6';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        password = value!;
                      });
                    },
                  ),
                ),

                TextButton(
                  onPressed: () {
                    Get.to(const ForgotScreen());

                    //forgot password screen
                  },
                  child: const Text(
                    'Forgot Password',
                    style: TextStyle(
                      color: Color(0xff58BE3F),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    color: Colors.white,
                    height: 55,
                    width: 200,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff58BE3F),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          // Background color
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            login
                                ? AuthServices.signinUser(
                                    email, password, context)
                                : AuthServices.signupUser(email, password,
                                    fullname, address, context);
                            //  Get.off(()=> ChossScreen());
                          }
                        },
                        child: Text(
                          login ? 'Login' : 'Signup',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                // const SizedBox(
                //   height: 5,
                // ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        login = !login;
                      });
                    },
                    child: Text(
                      login
                          ? "Don't have an account? Signup"
                          : "Already have an account? Login",
                      style: TextStyle(fontSize: 20, color: Colors.black45),
                    )),
                //     TextButton(
                // onPressed: () {
                //   setState(() {
                //     Get.to(()=> Sociallogin());
                //     //login = !login;
                //   });
                // },
                // child: Text('Sign Up with Number? Click here',
                //     style: TextStyle(fontSize:15, color: Colors.black45),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: file_names, avoid_unnecessary_containers, library_private_types_in_public_api
import 'constants.dart';

//import 'package:settings_ui/pages/settings.dart';
class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formkey = GlobalKey<FormState>();
  bool securepass = true;
  TextEditingController countryController = TextEditingController();
  var phone = "";
  var number = TextEditingController();
  var password = TextEditingController();
  // get nameController => null;
  bool showPassword = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  storeUserInfo() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance.collection('users').doc(uid).set({
      'name': nameController.text,
      'email': emailController.text,
      'password': passController.text,
      'address': addressController.text
    }).then((value) {
      nameController.clear();
      emailController.clear();
      passController.clear();
      addressController.clear();
      Get.to(() => ChossScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  autocorrect: true,
                  maxLength: 40,
                  controller: nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Name";
                    }
                    return null;
                  },
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
                    FilteringTextInputFormatter(RegExp(r'[a-zA-Z]+|\s'),
                        allow: true)
                  ], // Only numbers can be entered
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  controller: emailController,
                  autocorrect: true,
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                      return "Enter Correct Email Address Formate: abc@mail.com";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
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
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  autocorrect: true,
                  obscureText: true,
                  maxLength: 8,
                  controller: passController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Password";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Password",
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
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  controller: addressController,
                  autocorrect: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Address";
                    }
                    return null;
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
              const SizedBox(
                height: 80,
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: MaterialButton(
                  textColor: Colors.white,
                  color: const Color(0xff58BE3F),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: const Text(
                    'Save',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      storeUserInfo();
                      Get.to(ChossScreen());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

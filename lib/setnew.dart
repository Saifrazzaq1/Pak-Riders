import 'package:flutter/material.dart';

class ForgotPasswordNew extends StatefulWidget {
  const ForgotPasswordNew({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordNew> createState() => _ForgotPasswordNewState();
}

class _ForgotPasswordNewState extends State<ForgotPasswordNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                "Set New Password",
                style: TextStyle(
                    color: Color(0xff58BE3F),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              "Don’t worry!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              "Please Enter New Pasword",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'New Password',
                labelStyle: TextStyle(color: Colors.green),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
              ),
              obscureText: true,
              // controller: _newPasswordController,
            ),
          ),
          const SizedBox(height: 17.0),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: ' Confirm Password',
                labelStyle: TextStyle(color: Colors.green),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
              ),
              obscureText: true,
              // controller: _passwordController,
            ),
          ),
          const SizedBox(
            height: 130,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              width: double.infinity,
              height: 45,
              child: MaterialButton(
                textColor: Colors.white,
                color: const Color(0xff58BE3F),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: const Text(
                  'Login ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "login");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

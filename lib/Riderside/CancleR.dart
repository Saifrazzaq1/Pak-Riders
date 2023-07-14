// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:pakriders/constants.dart';

class CancleR extends StatefulWidget {
  const CancleR({super.key});

  @override
  State<CancleR> createState() => _CancleRState();
}

class _CancleRState extends State<CancleR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(

      children: [
        SizedBox(
          height: 10,
        ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Container(
                  height: 50,
                  width:MediaQuery.of(context).size.width*0.4,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: MaterialButton(
                    textColor: Colors.white,
                    color: const Color(0xff58BE3F),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: const Text(
                      'Post Here',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                   Get.to(Notescreen());
                      // Navigator.pushNamed(context, "login");
                    },
                  ),
                ),

                Container(
                  height: 50,
                  width:MediaQuery.of(context).size.width*0.4,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: MaterialButton(
                    textColor: Colors.white,
                    color: const Color(0xff58BE3F),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: const Text(
                      'Save Rides',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                     Get.to(SaverideR());

                      // Navigator.pushNamed(context, "login");
                    },
                  ),
                ),
              ],
            ),
          ),
        SizedBox(
          height: 10,
        ),
          Container(
                  height: 50,
            width:MediaQuery.of(context).size.width*0.7,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: MaterialButton(
                    textColor: Colors.white,
                    color: const Color(0xff58BE3F),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: const Text(
                      'Find Passenger',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                       Get.to(Findasseng());
                      // Navigator.pushNamed(context, "otp");

                      // Navigator.pushNamed(context, "login");
                    },
                  ),
                ),
          const SizedBox(
            height: 150,
          ),
          const Text(
            'You dont have any accept booking yet!',
            style: TextStyle(
              color: Colors.black38,
            ),
          )
      ],
    ),
        ));
  }
}

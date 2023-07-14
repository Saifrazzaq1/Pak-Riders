// ignore_for_file: file_names, unnecessary_new

import 'package:flutter/material.dart';
import 'package:pakriders/constants.dart';

class RejectedR extends StatefulWidget {
  const RejectedR({super.key});

  @override
  State<RejectedR> createState() => _RejectedRState();
}

class _RejectedRState extends State<RejectedR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(

      children: [
        const SizedBox(
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
                    // Navigator.pushNamed(context, "otp");

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
                   //  Get.to(FindRides());
                    // Navigator.pushNamed(context, "otp");

                    // Navigator.pushNamed(context, "login");
                  },
                ),
              ),
        const SizedBox(
          height: 150,
        ),
        const Text(
          'You dont have any rejected booking yet!',
          style: TextStyle(
            color: Colors.black38,
          ),
        )
      ],
    ));
  }
}

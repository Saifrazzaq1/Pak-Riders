// ignore_for_file: file_names, avoid_unnecessary_containers, prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:pakriders/constants.dart';

class ChossScreen extends StatefulWidget {
  const ChossScreen({Key? key}) : super(key: key);

  @override
  _ChossScreenState createState() => _ChossScreenState();
}

class _ChossScreenState extends State<ChossScreen> {
 
 @override
  void initState() {
    super.initState();
   
    // 1. This method call when app in terminated state and you get a notification
    // when you click on notification app open from terminated state and you can get notification data in this method

    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
          // if (message.data['_id'] != null) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => DemoScreen(
          //         id: message.data['_id'],
          //       ),
          //     ),
          //   );
          // }
        }
      },
    );

    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
      (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
          localNotificationService.createanddisplaynotification(message);

        }
      },
    );

    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
        }
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Image.asset('images/9.jpg'),
            // SizedBox(
            //   height: 10,
            // ),
            Container(
              height: 50,
              width: 450,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              // ignore: duplicate_ignore
              child: MaterialButton(
                textColor: Colors.white,
                color: const Color(0xff58BE3F),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                child: Text(
                  'Continue as Driver',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Get.to(BottomRid());
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text('--------  OR  --------'),
            SizedBox(
              height: 20,
            ),
            Image.asset('images/8.png'),
            // SizedBox(
            //   height: 10,
            // ),
            Container(
              height: 50,
              width: 450,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: MaterialButton(
                textColor: Colors.white,
                color: Color(0xff58BE3F),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                child: Text(
                  'Continue as User',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                 Get.to(MyHomePage());
                },
              ),
            ),
          ],
        )),
      ),
    );
  }
}

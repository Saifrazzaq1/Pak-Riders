// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:pakriders/constants.dart';

class Pending extends StatefulWidget {
  const Pending({super.key});

  @override
  State<Pending> createState() => _PendingState();
}

class _PendingState extends State<Pending> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String destination = 'Loading...';
  String start = 'Loading..';
  String date = 'Loading';
  User? user;
  void getData() async {
    user = FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance
        .collection('AllinOneU')
        .doc(user?.uid)
        .get();

    if (mounted) {
      setState(() {
        if (vari.exists) {
          destination = vari.data()!['destination'];
          start = vari.data()!['start'];
          date = vari.data()!['date'];
        } else {
          date = '';
          destination = '';
          start = '';
        }
      });
    }
  }

  @override
  void initState() {
    //  getRData();
    getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.4,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: MaterialButton(
                    textColor: Colors.white,
                    color: const Color(0xff58BE3F),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: const Text(
                      'Post here',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Get.to(NotescreenU());
                      // Navigator.pushNamed(context, "otp");

                      // Navigator.pushNamed(context, "login");
                    },
                  ),
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.4,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: MaterialButton(
                    textColor: Colors.white,
                    color: const Color(0xff58BE3F),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: const Text(
                      'Save Rides',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Get.to(SaverideU());
                      // Get.to(FindRides());
                      // Navigator.pushNamed(context, "otp");

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
            width: MediaQuery.of(context).size.width * 0.7,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: MaterialButton(
              textColor: Colors.white,
              color: const Color(0xff58BE3F),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Text(
                'Find Rider',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Get.to(FindRidesU());
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          date.isEmpty && destination.isEmpty && start.isEmpty
              ? Column(
                  children: [
                    SizedBox(
                      height: 150,
                    ),
                    Text('No data Exist Here'),
                  ],
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return ListTile(
                        subtitle: Container(
                          width: 300,
                          height: 100,
                          margin: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 4,
                                offset: Offset(6, 6),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Date: ',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      date,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Start: ',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      start,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'destination: ',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      destination,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}

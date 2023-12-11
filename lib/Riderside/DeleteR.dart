// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names, unnecessary_new

import 'package:flutter/material.dart';
import 'package:pakriders/constants.dart';

class DeleteR extends StatefulWidget {
  const DeleteR({super.key});

  @override
  State<DeleteR> createState() => _ConfirmRState();
}

class _ConfirmRState extends State<DeleteR> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String destination = 'Loading...';
  String start = 'Loading..';
  String date = 'Loading';
  User? user;
  void getData() async {
    user = FirebaseAuth.instance.currentUser;
    var docSnapshot = await FirebaseFirestore.instance
        .collection('deleteR')
        .doc(user?.uid)
        .get();

    if (docSnapshot.exists) {
      setState(() {
        destination = docSnapshot.data()!['destination'];
        start = docSnapshot.data()!['start'];
        date = docSnapshot.data()!['date'];
      });
    } else {
      print('Document does not exist');
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
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.4,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: MaterialButton(
                    textColor: Colors.white,
                    color: const Color(0xff58BE3F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Text(
                      'Post Here',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Get.to(Notescreen());
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
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Text(
                      'Save Rides',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Get.to(SaverideR());
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
                'Find Passenger',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Get.to(Findasseng());
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

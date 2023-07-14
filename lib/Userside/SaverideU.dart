// ignore_for_file: file_names

import 'package:pakriders/constants.dart';



// ignore_for_file: file_names
// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SaverideU extends StatefulWidget {
  const SaverideU({Key? key}) : super(key: key);

  @override
  State<SaverideU> createState() => SaverideUState();
}

class SaverideUState extends State<SaverideU> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String name = 'Loading...';
  String destination = 'Loading...';
  String start = 'Loading..';
  String number = 'Loading';
  String profilepic = 'Loading...';
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
          name = vari.data()!['name'];
          destination = vari.data()!['destination'];
          start = vari.data()!['start'];
          number = vari.data()!['number'];
          profilepic = vari.data()!['profilepic'];
        } else {
          name = '';
          destination = '';
          start = '';
          number = '';
          profilepic = '';
        }
      });
    }
  }

  Future<void> deleteData() async {
    await FirebaseFirestore.instance
        .collection('AllinOneU')
        .doc(user?.uid)
        .delete();

    // Refresh the screen
    getData();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff58BE3F),
        title: const Text('Save Rides'),
        centerTitle: true,
      ),
      body: name.isEmpty &&
          destination.isEmpty &&
          start.isEmpty &&
          number.isEmpty &&
          profilepic.isEmpty
          ? Center(
        child: Text(
          'No data available',
          style: TextStyle(fontSize: 20),
        ),
      )
          : Column(
        children: [
          Expanded(
            child: GridView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: 1,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 5.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    margin: const EdgeInsets.all(10.0),
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
                      padding: const EdgeInsets.only(left: 8.0,right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              CircleAvatar(
                                radius: screenWidth > 600 ? 90 : 60,
                                backgroundImage: NetworkImage(profilepic),
                              ),
                              const SizedBox(
                                height: 20,

                              ),
                              Text(
                                name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width * 0.08, // Adjust the font size based on screen width
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(
                                  'From: ',
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    start,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style:  TextStyle(
                                      fontSize: MediaQuery.of(context).size.width * 0.04,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.01,
                                ),
                                Text(
                                  'to: ',
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    destination,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize:  MediaQuery.of(context).size.width * 0.04,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.01,
                                ),
                                Text(
                                  'Contact:',
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    number,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    textAlign: TextAlign.center,
                                    style:  TextStyle(
                                      fontSize: MediaQuery.of(context).size.width * 0.04,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                IconButton(
                                  onPressed: deleteData,
                                  icon: const Icon(
                                    Icons.delete,
                                    size: 40,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
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


// ignore_for_file: file_names, non_constant_identifier_names
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart'; // Make sure to import Get package
import 'package:pakriders/Userside/settingsuser.dart';
import 'package:pakriders/constants.dart';

import 'RiderDetails.dart';

class RiderProfile extends StatefulWidget {
  const RiderProfile({Key? key}) : super(key: key);

  @override
  State<RiderProfile> createState() => _RiderProfileState();
}

class _RiderProfileState extends State<RiderProfile> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String name = 'Loading...';
  String email = 'Loading...';
  String address = 'Loading..';
  String type = 'Loading';
  String image1 = 'Loading...';
  double newEarnings = 0.0;
  // Create a variable to store total earnings
  double totalEarnings = 0.0;
  double Earns = 0.0;
  void getData() async {
    User? user = FirebaseAuth.instance.currentUser;

    // Fetch user data
    var vari = await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .get();
    var vari1 = await FirebaseFirestore.instance
        .collection('profilepic')
        .doc(user?.uid)
        .get();
    var vari2 = await FirebaseFirestore.instance
        .collection('vehicle')
        .doc(user?.uid)
        .get();
    var vari3 = await FirebaseFirestore.instance
        .collection('completedR')
        .doc(user?.uid)
        .get();

    // Check if the retrieved data is not null
    if (vari.exists && vari1.exists && vari2.exists && vari3.exists) {
      setState(() {
        name = vari.data()!['name'];
        email = vari.data()!['email'];
        address = vari.data()!['address'];
        type = vari2.data()!['type'];
        image1 = vari1.data()!['profilepic'];

        // Update total earnings
        newEarnings = double.parse(vari3.data()!['totalEarnings'] ?? '0');

// Update totalEarnings by adding the new value
        totalEarnings += newEarnings;

// Assign the updated totalEarnings to Earns if needed
        Earns = totalEarnings;
      });
    }
  }

  @override
  void initState() {
    totalEarnings = 0.0;
    Earns = 0.0;
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Rider Profile')),
        backgroundColor: Color(0xff58BE3F),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 115,
                    child: CircleAvatar(
                      radius: 110,
                      backgroundImage: NetworkImage(image1),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 100,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      child: IconButton(
                        onPressed: () {
                          Get.to(settingsuser());
                          // Add your button's functionality here
                        },
                        icon: Icon(
                          Icons.add_a_photo_rounded,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Driver :",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width *
                      0.06, // Responsive font size
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                name,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.07,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                type,
                style: TextStyle(
                  color: Color(0xff58BE3F),
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Divider(height: 1, thickness: 1, color: Colors.blueGrey[200]),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Earn:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width * 0.035,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    Earns.toStringAsFixed(2), // Keep it as String
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontFamily: "Arial",
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Divider(height: 1, thickness: 1, color: Colors.blueGrey[200]),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Email",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    email,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Address",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    address,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Language",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Pakistan, English",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Divider(height: 1, thickness: 1, color: Colors.blueGrey[200]),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.5,
                  // ignore: sort_child_properties_last
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => Riderdetails());
                      },
                      child: Text(
                        "More Details",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff58BE3F),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

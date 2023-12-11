// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:pakriders/Riderside/AddMaintain.dart';

import '../constants.dart';

class VehicleMaint extends StatefulWidget {
  const VehicleMaint({super.key});

  @override
  State<VehicleMaint> createState() => _VehicleMaintState();
}

class _VehicleMaintState extends State<VehicleMaint> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String plate = 'Loading...';
  String platenum = 'Loading...';
  String model = 'Loading..';
  String type = 'Loading';
  String Servicedate = 'Loading...';
  String Item = 'Loading...';
  String Milage = 'Loading...';
  String Note = 'Loading...';
  String costpkr = 'Loading...';
  String Nextdate = 'Loading...';

  void getData() async {
    User? user = await FirebaseAuth.instance.currentUser;
    // var vari= await FirebaseFirestore.instance.collection('users').doc(user?.uid).get();
    var vari = await FirebaseFirestore.instance
        .collection('vehicle')
        .doc(user?.uid)
        .get();
    var vari1 = await FirebaseFirestore.instance
        .collection('Maintaince')
        .doc(user?.uid)
        .get();
    setState(() {
      plate = vari.data()!['plate'];
      platenum = vari.data()!['platenum'];
      model = vari.data()!['model'];
      type = vari.data()!['type'];
      Servicedate = vari1.data()!['Servicedate'];
      Item = vari1.data()!['Item'];
      Milage = vari1.data()!['Milage'];
      Note = vari1.data()!['Note'];
      costpkr = vari1.data()!['costpkr'];
      Nextdate = vari1.data()!['Nextdate'];
    });
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
      appBar: AppBar(
        title: Text('Vehicle Maintenance'),
        backgroundColor: Color(0xff58BE3F),
      ),
      body: Stack(
        children: [
          // Your content goes here
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              // Set the height of the container
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), // Set border radius
                boxShadow: [
                  BoxShadow(
                    color: Colors.black, // Shadow color
                    blurRadius: 10, // Blur radius
                    offset: Offset(5, 5), // Offset
                  ),
                ],
                color: Colors.white, // Background color of the container
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      "Vehicle Details",
                      style: TextStyle(
                        color: Color(0xff58BE3F),
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Plate Alpha",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          plate,
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
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
                        const Text(
                          "Plate Num",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          platenum,
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
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
                        const Text(
                          "Model #",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          model,
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
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
                        const Text(
                          "Vehicle Type",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          type,
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(height: 3, thickness: 1, color: Colors.blueGrey[200]),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      "Service Details",
                      style: TextStyle(
                        color: Color(0xff58BE3F),
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "SERVICE DETAILS",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          Servicedate,
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
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
                        const Text(
                          "TYPES",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          Item,
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
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
                        const Text(
                          "COST (PKR)",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          costpkr,
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
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
                        const Text(
                          "CURRENT MILAGE (KM)",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          Milage,
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
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
                        const Text(
                          "NEXT SERVICE DATE",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          Nextdate,
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(height: 3, thickness: 1, color: Colors.blueGrey[200]),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Center(
                          child: Text(
                            "Service Notes",
                            style: TextStyle(
                              color: Color(0xff58BE3F),
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 140,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 226, 225, 225),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                Note,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 130, 73, 73),
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Round Button with + Icon
          Positioned(
            bottom: 16, // Adjust the bottom margin as needed
            right: 16, // Adjust the right margin as needed
            child: FloatingActionButton(
              onPressed: () {
                Get.to(
                    const AddMainatain()); // Add your button click logic here
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.green, // Change the button color
            ),
          ),
        ],
      ),
    );
  }
}

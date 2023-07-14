// ignore_for_file: file_names
import 'dart:io';

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
  //  File? imageXFile;
  void getData() async {
    User? user = await FirebaseAuth.instance.currentUser;
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

    setState(() {
      name = vari.data()!['name'];
      email = vari.data()!['email'];
      address = vari.data()!['address'];
      type = vari2.data()!['type'];
      image1 = vari1.data()!['profilepic'];
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "Total Rides:",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: MediaQuery.of(context).size.width * 0.035,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "1534",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        fontFamily: "Arial",
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Total Earn:",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: MediaQuery.of(context).size.width * 0.035,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "1534",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        fontFamily: "Arial",
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Years:",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: MediaQuery.of(context).size.width * 0.035,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "2,5",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        fontFamily: "Arial",
                      ),
                    )
                  ],
                )
              ],
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
                        Get.to(Riderdetails());
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

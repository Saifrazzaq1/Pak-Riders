// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pakriders/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatefulWidget {
  final String userId;

  const DetailsScreen({Key? key, required this.userId}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  double userRating = 0.0;
  String currentUserName = ''; // Declare the variable here
  Future<void> submitRating() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      print('User is not logged in.');
      return;
    }

    final ratingData = {
      'userName': currentUserName,
      'rating': userRating,
      'timestamp': FieldValue.serverTimestamp(),
    };

    try {
      await FirebaseFirestore.instance
          .collection('UserRatings')
          .doc(user.uid) // Use the user's UID as the document ID
          .collection('Ratings') // Create a subcollection for ratings
          .add(
              ratingData); // Use "add" to generate a new document with a unique ID
      Fluttertoast.showToast(
        msg: 'Submitted Successfully',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
    } catch (e) {
      print('Error submitting rating: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    // Retrieve the current user's name when the screen initializes
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      currentUserName = user.displayName ?? '';
    }
  }

  reachUs(String contact) async {
    var android_url = "whatsapp://send?phone=" +
        contact +
        "&text= Hi, User i find your post on PakRiders.";

    var iOS_url =
        "https://wa.me/$contact?text=${Uri.parse("Hi, User i find your post on PakRiders.")}";

    if (Platform.isIOS) {
      if (await canLaunch(iOS_url)) {
        await launch(iOS_url, forceSafariVC: false);
      } else {
        print('Whatsapp is not installed');
      }
    } else {
      if (await canLaunch(android_url)) {
        await launch(android_url);
      } else {
        print('Whatsapp is not installed');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve user details based on userId and display them on this screen
    // You can use the userId to fetch the specific user's data from Firestore

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff58BE3F),
        title: const Text(' Details'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('AllinOneU')
            .doc(widget.userId)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text('User not found'));
          }

          final userData = snapshot.data!.data() as Map<String, dynamic>;

          final imageUrl = userData['profilepic'] ?? '';
          final imageUrl1 = userData['mapshot'] ?? '';
          final name = userData['name'] ?? '';
// final plate = userData['plate'] ?? '';
// final platenum = userData['platenum'] ?? '';
// final type = userData['type'] ?? '';
// final model = userData['model'] ?? '';
          final start = userData['start'] ?? '';
          final destination = userData['destination'] ?? '';
          final distance = userData['distance'] ?? '';
          final costBike = userData['costB'] ?? '';
          final costCar = userData['costC'] ?? '';
          final date = userData['date'] ?? '';
          final time = userData['time'] ?? '';
          final prov = userData['prov'] ?? '';
          final city = userData['city'] ?? '';
          final number = userData['number'] ?? '';
          final email = userData['email'] ?? '';

          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                //  const Center(
                //    child: Text(
                //     'Rider:',
                //     style: TextStyle(
                //       fontSize: 30,
                //       fontWeight: FontWeight.bold,
                //     ),
                //                ),
                //  ),
                const SizedBox(
                  height: 30,
                ),
                CircleAvatar(
                  radius: 120,
                  backgroundImage: NetworkImage(imageUrl),
                ),
                const SizedBox(height: 20),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //    Divider(height: 3, thickness: 1, color: Colors.blueGrey[200]),
                //    const Center(
                //      child: Text(
                //       'Vehicle Details:',
                //       style: TextStyle(
                //         fontSize: 30,
                //         fontWeight: FontWeight.bold,
                //       ),
                //                  ),
                //    ),
                //    Padding(
                //   padding: const EdgeInsets.only(top: 30,left: 12,right: 30,bottom: 10),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       const Text(" Plate Alfa: ",
                //       style: TextStyle(
                //         fontSize: 20,
                //         fontWeight: FontWeight.bold,
                //       ),
                //       ),
                //        Text(plate,
                //       style: const TextStyle(
                //         fontSize: 20
                //       ),
                //       )
                //     ],
                //   ),
                // ),
                //  Padding(
                //   padding: const EdgeInsets.only(top: 10,left: 12,right: 30,bottom: 10),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       const Text(" Plate Num: ",
                //       style: TextStyle(
                //         fontSize: 20,
                //         fontWeight: FontWeight.bold,
                //       ),
                //       ),
                //        Text(platenum,
                //       style: const TextStyle(
                //         fontSize: 20
                //       ),
                //       )
                //     ],
                //   ),
                // ),
                //  Padding(
                //   padding: const EdgeInsets.only(top: 10,left: 12,right: 30,bottom: 10),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       const Text(" Vehicle type: ",
                //       style: TextStyle(
                //         fontSize: 20,
                //         fontWeight: FontWeight.bold,
                //       ),
                //       ),
                //        Text(type,
                //       style: const TextStyle(
                //         fontSize: 20
                //       ),
                //       )
                //     ],
                //   ),
                // ),
                //  Padding(
                //   padding: const EdgeInsets.only(top: 10,left: 12,right: 30,bottom: 20),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       const Text(" Model no: ",
                //       style: TextStyle(
                //         fontSize: 20,
                //         fontWeight: FontWeight.bold,
                //       ),
                //       ),
                //        Text(model,
                //       style: const TextStyle(
                //         fontSize: 20
                //       ),
                //       )
                //     ],
                //   ),
                // ),
                Divider(height: 3, thickness: 1, color: Colors.blueGrey[200]),
                const Center(
                  child: Text(
                    'Ride Details:',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 30, left: 12, right: 30, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        " Start: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        start,
                        style: const TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 12, right: 30, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        " Destination: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        destination,
                        style: const TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 12, right: 30, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        " distance: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        distance,
                        style: const TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 12, right: 30, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        " Bike Cost: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        costBike,
                        style: const TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 12, right: 30, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        " Car Cost: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        costCar,
                        style: const TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 12, right: 30, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        " Date: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        date,
                        style: const TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 12, right: 30, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        " Time: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        time,
                        style: const TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
                Divider(height: 3, thickness: 1, color: Colors.blueGrey[200]),
                const Center(
                  child: Text(
                    'User Details:',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 30, left: 12, right: 30, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        " Province: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        prov,
                        style: const TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 12, right: 30, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        " Area/City: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        city,
                        style: const TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 12, right: 30, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        " Contact: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        number,
                        style: const TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 12, right: 30, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        " Email: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        email,
                        style: const TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
                Divider(height: 3, thickness: 1, color: Colors.blueGrey[200]),
                const Center(
                  child: Text(
                    'Map Details:',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    width: 430,
                    height: 500,
                    color: Colors.white,
                    child: Center(
                      child: Image.network(
                        imageUrl1,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(const openMap());
                          // Handle button 1 press
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          // ignore: deprecated_member_use
                          primary: const Color(0xff58BE3F),
                        ),
                        child: const Text(
                          'Open Google Map',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle button 2 press
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          primary: const Color(0xff58BE3F),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            reachUs(number);
                          },
                          child: const Text(
                            'Chat with User',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Divider(height: 3, thickness: 1, color: Colors.blueGrey[200]),
                const Center(
                  child: Text(
                    'Rate This User',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 180,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 226, 225, 225),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            // Add a UI for rating
                            RatingBar.builder(
                              initialRating:
                                  userRating, // Initialize with the current user's rating
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: false,
                              itemCount: 5,
                              itemSize: 40.0,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                setState(() {
                                  userRating = rating;
                                });
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Current Rating: ${userRating.toStringAsFixed(1)}',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            ElevatedButton(
                              onPressed: () {
                                submitRating();
                                // You can also show a confirmation message to the user here
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color(
                                    0xff58BE3F), // Change this color to your desired button color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10), // Customize the button's shape
                                ),
                              ),
                              child: Text(
                                "Submit Rating",
                                style: TextStyle(
                                  color: Colors
                                      .white, // Change this color to the text color you want
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

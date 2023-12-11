import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SaverideR extends StatefulWidget {
  const SaverideR({Key? key}) : super(key: key);

  @override
  State<SaverideR> createState() => SaverideRState();
}

class SaverideRState extends State<SaverideR> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String name = 'Loading...';
  String destination = 'Loading...';
  String start = 'Loading..';
  String number = 'Loading';
  String profilepic = 'Loading...';
  String date = 'Loading...';
  User? user;

  void getData() async {
    user = FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance
        .collection('AllinOne')
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
          date = vari.data()!['date'];
        } else {
          name = '';
          destination = '';
          start = '';
          number = '';
          profilepic = '';
          date = '';
        }
      });
    }
  }

  Future<void> deleteData() async {
    // Store data in 'deleteR' collection against user's ID
    await FirebaseFirestore.instance.collection('deleteR').doc(user?.uid).set({
      'name': name,
      'destination': destination,
      'start': start,
      'number': number,
      'date': date,
    });

    // Delete data from 'AllinOne' collection
    await FirebaseFirestore.instance
        .collection('AllinOne')
        .doc(user?.uid)
        .delete();

    // Refresh the screen
    getData();
  }

  Future<void> showEarningsPopup() async {
    String totalEarnings = ''; // Initialize with an empty string

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Total Earnings'),
          content: TextField(
            onChanged: (value) {
              totalEarnings = value;
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                // Validate totalEarnings if needed

                // Save data to the 'completed' collection
                await FirebaseFirestore.instance
                    .collection('completedR')
                    .doc(user?.uid)
                    .set({
                  'name': name,
                  'destination': destination,
                  'start': start,
                  'number': number,
                  'date': date,
                  'totalEarnings': totalEarnings,
                });

                // Refresh the screen
                getData();

                // Close the dialog
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Future<void> CompleteData() async {
    await showEarningsPopup();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff58BE3F),
        title: const Text('Save Rides'),
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
                    itemCount: 1,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0, // Adjust this spacing if needed
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
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
                            padding: const EdgeInsets.only(left: 8.0, right: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 60,
                                      backgroundImage: NetworkImage(profilepic),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      name,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize:
                                            20, // Adjust this font size as needed
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'From: ',
                                        style: TextStyle(
                                          fontSize:
                                              20, // Adjust this font size as needed
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          start,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                          style: TextStyle(
                                            fontSize:
                                                16, // Adjust this font size as needed
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'to: ',
                                        style: TextStyle(
                                          fontSize:
                                              20, // Adjust this font size as needed
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          destination,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                          style: TextStyle(
                                            fontSize:
                                                16, // Adjust this font size as needed
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Contact:',
                                        style: TextStyle(
                                          fontSize:
                                              20, // Adjust this font size as needed
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          number,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize:
                                                16, // Adjust this font size as needed
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                        width: 100,
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: deleteData,
                                            icon: const Icon(
                                              Icons.delete,
                                              size: 40,
                                              color: Colors.green,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          IconButton(
                                            onPressed: deleteData,
                                            icon: const Icon(
                                              Icons.edit,
                                              size: 40,
                                              color: Colors.green,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          IconButton(
                                            onPressed: CompleteData,
                                            icon: const Icon(
                                              Icons.check_box,
                                              size: 40,
                                              color: Colors.green,
                                            ),
                                          ),
                                        ],
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

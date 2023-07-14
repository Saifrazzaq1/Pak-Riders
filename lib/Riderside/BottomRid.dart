// ignore_for_file: file_names, library_private_types_in_public_api

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pakriders/Riderside/SettingsRider.dart';
import 'package:pakriders/Riderside/priviacy_policy.dart';
import 'package:pakriders/UserProfil.dart';
import 'package:pakriders/constants.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:share_plus/share_plus.dart';

import 'RiderProf.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomRid extends StatefulWidget {
  const BottomRid({super.key});

  @override
  _BottomRidState createState() => _BottomRidState();
}

class _BottomRidState extends State<BottomRid> {
  String name = 'loading';
  String email = 'email';
  String image = 'Loading...';
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

    setState(() {
      name = vari.data()!['name'];
      email = vari.data()!['email'];
      image = vari1.data()?['profilepic'];
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  int selectedpage = 0;
  final _pageNo = [
    const ConfirmR(),
    const PendingR(),
    const RejectedR(),
    const CancleR(),
    const CompleteR()
  ];
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                ), //BoxDecoration
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.green),
                  accountName: Text(
                    name,
                    style: TextStyle(fontSize: 15),
                  ),
                  accountEmail: Text(email),
                  currentAccountPictureSize: Size.square(50),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 165, 255, 137),
                    child: CircleAvatar(
                      radius: 120,
                      backgroundImage: NetworkImage(image),
                    ),

                    //Text
                  ), //circleAvatar
                ), //UserAccountDrawerHeader
              ), //DrawerHeader
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text(' My Profile '),
                onTap: () {
                  Get.to(RiderProfile());
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text(' Settings'),
                onTap: () {
                  Get.to(settingsR());
                },
              ),
              ListTile(
                leading: const Icon(Icons.policy),
                title: const Text(' Privacy Policy '),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PrivacyPolicy()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.car_rental),
                title: const Text(' Register Vehicle '),
                onTap: () {
                  Get.to(VehicleDetailsScreen());
                },
              ),
              ListTile(
                leading: const Icon(Icons.chat_bubble_outline_outlined),
                title: const Text(' Official whatsapp '),
                onTap: () {
                  reachUs() async {
                    var androidNumber =
                        "03023275555"; // Update with your Pakistani WhatsApp number

                    var androidUrl =
                        "whatsapp://send?phone=$androidNumber&text=Hi, I need some help";

                    var iOSNumber =
                        "03023275555"; // Update with your Pakistani WhatsApp number

                    var iOSUrl =
                        "https://wa.me/$iOSNumber?text=${Uri.parse("Hi, I need some help")}";

                    if (Platform.isIOS) {
                      if (await canLaunch(iOSUrl)) {
                        await launch(iOSUrl, forceSafariVC: false);
                      } else {
                        print('WhatsApp is not installed');
                      }
                    } else {
                      if (await canLaunch(androidUrl)) {
                        await launch(androidUrl);
                      } else {
                        print('WhatsApp is not installed');
                      }
                    }
                  }

                  reachUs();
                },
              ),
              ListTile(
                leading: const Icon(Icons.share),
                title: const Text(' Share This App '),
                onTap: () {
                  final String appLink =
                      'https://PakRiders.com/app'; // Replace with the actual app link

                  Share.share('Check out this amazing app: $appLink');
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('LogOut'),
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginForm()),
                  );
                },
              ),
            ],
          ),
        ),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: AppBar(
            backgroundColor: const Color(0xff58BE3F),
            title: const Text('Rider Home'),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(50),
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
                onPressed: () {
                  // do something
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.chat,
                  color: Colors.white,
                ),
                onPressed: () {
                  // do something
                },
              )
            ],
          ),
        ),
        body: _pageNo[selectedpage],
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: const Color(0xff58BE3F),
          style: TabStyle.react,
          items: const [
            TabItem(icon: Icons.check, title: 'Confirm'),
            TabItem(icon: Icons.replay, title: 'Pending'),
            TabItem(icon: Icons.thumb_down_alt, title: 'Reject'),
            TabItem(icon: Icons.close, title: 'Cancel'),
            TabItem(icon: Icons.task_alt, title: 'Complete'),
          ],
          initialActiveIndex: selectedpage,
          onTap: (int index) {
            setState(() {
              selectedpage = index;
            });
          },
        ),
      ),
    );
  }
}

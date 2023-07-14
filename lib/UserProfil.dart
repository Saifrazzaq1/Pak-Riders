// ignore_for_file: file_names

import 'package:pakriders/Userside/settingsuser.dart';

import 'constants.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String name = 'loading';
  String email = 'email';
  String address = '';
  String type = 'Loading';
  String image = 'Loading...';
// File? imageXFile;

  void getData() async {
    User? user = firebaseAuth.currentUser;
    if (user != null) {
      var vari = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      var vari1 = await FirebaseFirestore.instance
          .collection('profilepic')
          .doc(user.uid)
          .get();

      if (vari.exists && vari1.exists) {
        setState(() {
          name = vari.data()?['name'] ?? 'No name available';
          email = vari.data()?['email'] ?? 'No email available';
          address = vari.data()?['address'] ?? 'No address available';
          type = vari1.data()?['type'] ?? 'No type available';
          image = vari1.data()?['profilepic'] ?? 'No image available';
        });
      } else {
        setState(() {
          name = 'Data not found';
          email = 'Data not found';
          address = 'Data not found';
          type = 'Data not found';
          image = 'Data not found';
        });
      }
    } else {
      setState(() {
        name = 'User not logged in';
        email = 'User not logged in';
        address = 'User not logged in';
        type = 'User not logged in';
        image = 'User not logged in';
      });
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('User Profile')),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 115,
                    child: CircleAvatar(
                      radius: 110,
                      backgroundImage: NetworkImage(image),
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
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green
                      .withOpacity(0.2), // Set your desired background color
                  borderRadius:
                      BorderRadius.circular(10), // Set the border radius
                ),
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height *
                      0.01, // Responsive vertical padding
                  horizontal: MediaQuery.of(context).size.width *
                      0.04, // Responsive horizontal padding
                ),
                child: Text(
                  "User :",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width *
                        0.06, // Responsive font size
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.03, // Responsive height
            ),
            Center(
              child: Text(
                name,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width *
                      0.08, // Responsive font size
                  shadows: [
                    Shadow(
                      color: Colors.green.withOpacity(0.3), // Set shadow color
                      offset: Offset(2, 2), // Set shadow offset
                      blurRadius: 4, // Set shadow blur radius
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
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
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    email,
                    style: TextStyle(
                      fontSize: 16,
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
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    address,
                    style: TextStyle(
                      fontSize: 16,
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
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Pakistan, English",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: Colors.blueGrey[200],
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}

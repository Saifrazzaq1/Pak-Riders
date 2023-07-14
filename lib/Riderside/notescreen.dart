import 'package:pakriders/constants.dart';

class Notescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double paddingValue = MediaQuery.of(context).size.width * 0.05;
    final double spacingValue = MediaQuery.of(context).size.height * 0.02;
    final double imageHeight = MediaQuery.of(context).size.height * 0.3;
    final double imageWidth = MediaQuery.of(context).size.width * 0.8;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Guide page',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xff58BE3F),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(paddingValue),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(paddingValue),
                child: Text(
                  '* Before you continue, here are some important steps you need to understand:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(height: spacingValue),
              Padding(
                padding: EdgeInsets.all(paddingValue),
                child: Text(
                  'Step 1:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(paddingValue),
                child: Text(
                  'After you press the "Agreed" button, the Google Maps screen will open with your current location. Now you have to enter the start and destination locations.',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Image.asset(
                'images/map.jpeg',
                height: imageHeight,
                width: imageWidth,
              ),
              SizedBox(height: spacingValue),
              Padding(
                padding: EdgeInsets.all(paddingValue),
                child: Text(
                  'Step 2:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(paddingValue),
                child: Text(
                  'Now, you have to click the "Show Route" button. It will calculate the distance in kilometers and show you pipelined locations as shown here:',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Image.asset(
                'images/map1.jpeg',
                height: imageHeight,
                width: imageWidth,
              ),
              SizedBox(height: spacingValue),
              Padding(
                padding: EdgeInsets.all(paddingValue),
                child: Text(
                  'Step 3:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(paddingValue),
                child: Text(
                  'After you calculate the route, you have to take a screenshot of the map screen. You need to upload the screenshot from the gallery by clicking the "Upload" button.',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Image.asset(
                'images/map2.jpeg',
                height: imageHeight,
                width: imageWidth,
              ),
              SizedBox(height: spacingValue),
              Padding(
                padding: EdgeInsets.all(paddingValue),
                child: Text(
                  'Step 4:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(paddingValue),
                child: Text(
                  'After you upload the screenshot, it will show you some of your data. You have to press the "Calculate" button to update the cost.',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Image.asset(
                'images/map3.jpeg',
                height: imageHeight,
                width: imageWidth,
              ),
              SizedBox(height: spacingValue),
              Padding(
                padding: EdgeInsets.all(paddingValue),
                child: Text(
                  'Step 5:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(paddingValue),
                child: Text(
                  'After you calculate the cost, you have to pick the date and time by clicking the "Date Time" button.',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Image.asset(
                'images/map4.jpeg',
                height: imageHeight,
                width: imageWidth,
              ),
              SizedBox(height: spacingValue),
              Padding(
                padding: EdgeInsets.all(paddingValue),
                child: Text(
                  'Step 6:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(paddingValue),
                child: Text(
                  'After you pick the date and time, you need to take a screenshot of the uploaded map. Finally, click the "Save" button to save the post.',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Image.asset(
                'images/map5.jpeg',
                height: imageHeight,
                width: imageWidth,
              ),
              SizedBox(height: spacingValue),
              Padding(
                padding: EdgeInsets.all(paddingValue),
                child: Text(
                  'Step 7:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(paddingValue),
                child: Text(
                  'The "Thank You" screen will open, confirming that all data has been uploaded successfully. Press the "Home" button to continue.',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(paddingValue),
                child: Image.asset(
                  'images/map6.jpeg',
                  height: imageHeight,
                  width: imageWidth,
                ),
              ),
              Divider(height: 3, thickness: 1, color: Colors.blueGrey[200]),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(paddingValue),
                  child: MaterialButton(
                    height: 40,
                    minWidth: 250,
                    color: const Color(0xff58BE3F),
                    textColor: Colors.white,
                    elevation: 10,
                    child: Text(
                      'Agreed',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      Get.to(postR());
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// class SaverideR extends StatefulWidget {
//   const SaverideR({Key? key}) : super(key: key);
//
//   @override
//   State<SaverideR> createState() => SaverideRState();
// }
//
// class SaverideRState extends State<SaverideR> {
//   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//   String name = 'Loading...';
//   String destination = 'Loading...';
//   String start = 'Loading..';
//   String number = 'Loading';
//   String profilepic = 'Loading...';
//
//   void getData() async {
//     User? user = await FirebaseAuth.instance.currentUser;
//     var vari = await FirebaseFirestore.instance
//         .collection('AllinOne')
//         .doc(user?.uid)
//         .get();
//     setState(() {
//       name = vari.data()!['name'];
//       destination = vari.data()!['destination'];
//       start = vari.data()!['start'];
//       number = vari.data()!['number'];
//       profilepic = vari.data()!['profilepic'];
//     });
//   }
//
//   @override
//   void initState() {
//     getData();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: const Color(0xff58BE3F),
//         title: const Text('Save Rides'),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: GridView.builder(
//               physics: const AlwaysScrollableScrollPhysics(),
//               itemCount: 1,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: screenWidth > 600 ? 2 : 1,
//                 crossAxisSpacing: 5.0,
//               ),
//               itemBuilder: (BuildContext context, int index) {
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     width: screenWidth > 600 ? 400 : screenWidth * 0.8,
//                     height: screenHeight * 0.3,
//                     margin: const EdgeInsets.all(10.0),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black54,
//                           blurRadius: 4,
//                           offset: const Offset(6, 6), // Shadow position
//                         ),
//                       ],
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 8.0, right: 8),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//
//                               CircleAvatar(
//                                 radius: screenWidth > 600 ? 90 : 60,
//                                 backgroundImage: NetworkImage(profilepic),
//                               ),
//                               const SizedBox(
//                                 height: 20,
//
//                               ),
//                               Text(
//                                 name,
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   fontSize: MediaQuery.of(context).size.width * 0.05,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//
//                             ],
//                           ),
//
//                           Expanded(
//                             child: Padding(
//                               padding: const EdgeInsets.all(8),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//
//
//                                   Text(
//                                     'From: ',
//                                     style: TextStyle(
//                                       fontSize: MediaQuery.of(context).size.width * 0.05,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   FittedBox(
//                                     fit: BoxFit.scaleDown,
//                                     child: Text(
//                                       start,
//                                       textAlign: TextAlign.center,
//
//                                       overflow: TextOverflow.ellipsis,
//                                       maxLines: 3,
//                                       style: TextStyle(
//                                         fontSize: MediaQuery.of(context).size.width * 0.04,
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: MediaQuery.of(context).size.height * 0.01,
//                                   ),
//                                   Text(
//                                     'to: ',
//                                     style: TextStyle(
//                                       fontSize: MediaQuery.of(context).size.width * 0.05,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   FittedBox(
//                                     fit: BoxFit.scaleDown,
//                                     child: Text(
//                                       destination,
//                                       textAlign: TextAlign.center,
//
//                                       overflow: TextOverflow.ellipsis,
//                                       maxLines: 3,
//                                       style: TextStyle(
//                                         fontSize: MediaQuery.of(context).size.width * 0.04,
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: MediaQuery.of(context).size.height * 0.01,
//                                   ),
//                                   Text(
//                                     'Contact:',
//                                     style: TextStyle(
//                                       fontSize: MediaQuery.of(context).size.width * 0.05,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   FittedBox(
//                                     fit: BoxFit.scaleDown,
//                                     child: Text(
//                                       number,
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         fontSize: MediaQuery.of(context).size.width * 0.04,
//                                       ),
//                                     ),
//                                   ),
//
//                                   const SizedBox(
//                                     height: 20,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
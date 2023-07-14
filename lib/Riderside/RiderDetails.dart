import 'package:pakriders/constants.dart';
class Riderdetails extends StatefulWidget {
  const Riderdetails({super.key});

  @override
  State<Riderdetails> createState() => _RiderdetailsState();
}

class _RiderdetailsState extends State<Riderdetails> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    String plate='Loading...';
    String platenum='Loading...';
    String model='Loading..';
    String type='Loading';
    String image='Loading...';
    String image1='Loading...';
    String image2='Loading...';
   void getData() async {
    User? user= await FirebaseAuth.instance.currentUser;
   // var vari= await FirebaseFirestore.instance.collection('users').doc(user?.uid).get();
     var vari= await FirebaseFirestore.instance.collection('vehicle').doc(user?.uid).get();
    setState(() {
    plate=vari.data()!['plate'];
    platenum=vari.data()!['platenum'];
    model=vari.data()!['model'];
    type=vari.data()!['type'];
    image= vari.data()!['CNIC'];
    image1= vari.data()!['Vehicle card'];
    image2= vari.data()!['Selfi'];
   // image=vari1.data()!['Selfi'];

    });

  }
   @override
     void initState(){
    //  getRData();
    getData();
   
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('More Details')),
        backgroundColor:Color(0xff58BE3F),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
        children: [ SizedBox(height: 10,),
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
            const SizedBox(height: 40,),
          Center(
            child: Text(
              "CNIC",
              style: TextStyle(
                color: Color(0xff58BE3F),
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width * 0.06, // Adjust the font size based on screen width
              ),
            ),
          ),

          Padding(
                    padding:  EdgeInsets.all(10.0),
                    child: Container(
                      width: 330,
                      height: 250,
                      color: Colors.black12 ,
                      child: Center(
                        child: Image.network(image,
                         fit: BoxFit.fitWidth,
                         ),
                      ),
                    ),
                  ),
                    Divider(height: 1, thickness: 1, color: Colors.blueGrey[200]),
            const SizedBox(height: 40,),
          Center(
            child: Text(
              "Vehicle Card",
              style: TextStyle(
                color: Color(0xff58BE3F),
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width * 0.06, // Adjust the font size based on screen width
              ),
            ),
          ),

          Padding(
                    padding:  EdgeInsets.all(10.0),
                    child: Container(
                      width: 330,
                      height: 250,
                      color: Colors.black12 ,
                      child: Center(
                        child: Image.network(image1,
                         fit: BoxFit.cover,
                         ),
                      ),
                    ),
                  ),
                    Divider(height: 1, thickness: 1, color: Colors.blueGrey[200]),
            const SizedBox(height: 40,),
          Center(
            child: Text(
              "Selfie",
              style: TextStyle(
                color: Color(0xff58BE3F),
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width * 0.06, // Adjust the font size based on screen width
              ),
            ),
          ),

          Padding(
                    padding:  EdgeInsets.all(10.0),
                    child: Container(
                      width: 330,
                      height: 250,
                      color: Colors.black12 ,
                      child: Center(
                        child: Image.network(image2,
                         fit: BoxFit.cover,
                         ),
                      ),
                    ),
                  ),
        ]
        ),
      ),
    );
  }
}
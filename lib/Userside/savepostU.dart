import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pakriders/constants.dart';

class savepostU extends StatefulWidget {
  const savepostU({super.key});

  @override
  State<savepostU> createState() => _savepostUState();
}

class _savepostUState extends State<savepostU> {
   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    String _startAddress='Loading...';
    String _destinationAddress='Loading...';
    String _placeDistance='Loading..';
    String Profpic='Loading...';
    //  String plate='Loading...';
    // String platenum='Loading...';
    // String model='Loading..';
    // String type='Loading';
    String name='Loading';
    String email='Loading';
    String date='Loading';
    String time='Loading';
    String prov='Loading';
    String city='Loading';
     String mapshot='Loading';
      String number='Loading';
       String costBike='Loading';
       String costCar='Loading';
   // String image='Loading...';

    //  late double Fuel_efficiency, fuel_price=282.00;
    //  late double fuel;
    //  late double cost=0.0;

   
   void getData() async {
    User? user= await FirebaseAuth.instance.currentUser;
   // var vari= await FirebaseFirestore.instance.collection('users').doc(user?.uid).get();
     var vari= await FirebaseFirestore.instance.collection('FindpostU').doc(user?.uid).get();
     
    setState(() {
    _startAddress=vari.data()!['start'];
    _destinationAddress=vari.data()!['destination'];
    _placeDistance=vari.data()!['distance'];
      

    });
    var vari1= await FirebaseFirestore.instance.collection('MapshotU').doc(user?.uid).get();
    setState(() {
      mapshot= vari1.data()!['mapshotu'];
    });
    //  var vari2= await FirebaseFirestore.instance.collection('vehicle').doc(user?.uid).get();
    //  setState(() {
      
    //  plate=vari2.data()!['plate'];
    // platenum=vari2.data()!['platenum'];
    // model=vari2.data()!['model'];
    // type=vari2.data()!['type'];
   

    //  });
      var vari3= await FirebaseFirestore.instance.collection('users').doc(user?.uid).get();
      setState(() {
        name= vari3.data()!['name'];
        email= vari3.data()!['email'];
      });
       var vari4= await FirebaseFirestore.instance.collection('Findp1U').doc(user?.uid).get();
       setState(() {
          date= vari4.data()!['date'];
          time= vari4.data()!['time'];
          city= vari4.data()!['city'];
          prov= vari4.data()!['prov'];
          number= vari4.data()!['number'];
           costCar= vari4.data()!['costC'];
           costBike= vari4.data()!['costB'];
       });
       var vari5= await FirebaseFirestore.instance.collection('profilepic').doc(user?.uid).get();
      setState(() {
        Profpic=vari5.data()!['profilepic'];
      });
  }
    storeUserInfo()async{
  String uid= FirebaseAuth.instance.currentUser!.uid;
  FirebaseFirestore.instance.collection('AllinOneU').doc(uid).set({
    //user
    'name': name,
    'email': email,
    //vehicle
    // 'plate': plate,
    // 'platenum': platenum,
    // 'model': model,
    // 'type': type,
    
    //mapshot
    'mapshot': mapshot.toString(),
    //findpost
    
    'start':_startAddress,
    'destination': _destinationAddress,
    'distance': _placeDistance.toString(),

    //Findp1
     'city': city,
     'prov': prov,
     'date': date,
     'time': time,
     'number': number,
     'costB': costBike,
     'costC': costCar,

     //'profilepic
     'profilepic':Profpic.toString(),

   } ).whenComplete(() => Utils().toastMessage(' Data Upload Successfully') ); }
    @override
     void initState(){
    //  getRData();
    getData();
   
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 300,
                ),
                Text('Thanks for Posting ',
                style: TextStyle(
                  fontSize: 30
        
                ),),
                SizedBox(
                  height: 100,
                ),
                Container(
                  height: 50,
                  width: 200,
                  color: Color(0xff58BE3F),
                  child: MaterialButton(onPressed: () { 
                   // getData();
                    storeUserInfo();
                    Get.to(()=>  const MyHomePage());
                   }, 
                  child: Text('Home',style: TextStyle(
                    fontSize:20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),),
                  
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
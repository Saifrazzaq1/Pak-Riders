// ignore_for_file: avoid_print

import 'package:pakriders/Riderside/savepost.dart';
import 'package:pakriders/constants.dart';
import 'package:intl/intl.dart';
import 'dart:math';
class MoreridedataU extends StatefulWidget {
  const MoreridedataU({super.key});

  @override
  State<MoreridedataU> createState() => _MoreridedataUState();
}

class _MoreridedataUState extends State<MoreridedataU> {
   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    String _startAddress='Loading...';
    String _destinationAddress='Loading...';
    String _placeDistance='Loading..';
    String image='Loading...';
     String type='Loading';
     String contact='Loading';
     late double Fuel_efficiency,Fuel_efficiency1, fuel_price=282.00;
     late double fuel;
     late double costBike=0.0;
     late double costCar=0.0;

   
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
      image= vari1.data()!['mapshotu'];
    });
    //  var vari2= await FirebaseFirestore.instance.collection('vehicle').doc(user?.uid).get();
    //  setState(() {
    //    type=vari2.data()!['type'];
    //  });
  }
    storeUserInfo()async{
  String uid= FirebaseAuth.instance.currentUser!.uid;
  FirebaseFirestore.instance.collection('Findp1U').doc(uid).set({
    'date':_dateController.text,
    'time':_timeController.text,
    'city':city.text,
    'prov':Province.text,
    'number':Number.text,
    'costB': costBike.toString(),
    'costC': costCar.toString(),
  //  'start': startAddressController.text,
  //  'destination': destinationAddressController.text,
  //  'distance': _placeDistance.toString(),
     

   } ).whenComplete(() => Utils().toastMessage('Upload Successfully') ); }
  
  TextEditingController Province = TextEditingController();
  TextEditingController city = TextEditingController();
    TextEditingController Number = TextEditingController();


 late double _height;
  late double _width;

  late String _setTime, _setDate;

  late String _hour, _minute, _time;

  late String dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = const TimeOfDay(hour: 00, minute: 00);

  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeController.text = _time;
        _timeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });
  }
   @override
  void initState() {
    _dateController.text = DateFormat.yMd().format(DateTime.now());

    _timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
          getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    dateTime = DateFormat.yMd().format(DateTime.now());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(child: Text('Ride Data')),
        backgroundColor: const Color(0xff58BE3F),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16.0),
              Padding(
              padding: const EdgeInsets.only(top: 10,left: 8,right: 8,bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(" Start: ",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                   Text(_startAddress,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.04
                  ),
                  )
                ],
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(top: 10,left: 8,right: 8,bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(" destination: ",
                  style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                   Text(_destinationAddress,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.04
                  ),
                  )
                ],
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(top: 10,left: 8,right: 8,bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(" Distance: ",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                   Text(_placeDistance+' Km',
                  style:  TextStyle(
                    fontSize:MediaQuery.of(context).size.width * 0.04
                  ),
                  )
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 10,left: 8,right: 8,bottom: 8),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       const Text(" Vehicle Type: ",
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
             Divider(height: 1, thickness: 1, color: Colors.blueGrey[200]),
             Padding(
               padding: const EdgeInsets.only(left: 2.0,right: 2),
               child: Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    const SizedBox(height: 20,),
                        Center(child: Text('Fair Calculation',style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff58BE3F),
                       ),)),
                        const SizedBox(height: 20,),
                       Padding(
                         padding: const EdgeInsets.only(left: 8.0,right: 8),
                         child: Container(
                          height: 300,
                          width:MediaQuery.of(context).size.width,
                           decoration: BoxDecoration(
    color: Color.fromARGB(255, 226, 225, 225),
    borderRadius: BorderRadius.circular(10.0),
  ),
                          //color: Colors.amberAccent,
                          child: Column(
                            children: [
                               Padding(
                padding: const EdgeInsets.only(top: 20,left: 8,right: 8,bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(" Vehicle Type: ",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                     Text(type,
                    style:  TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    ),
                    )
                  ],
                ),
            ),
               Padding(
                padding: const EdgeInsets.only(top: 10,left: 8,right: 8,bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(" Distance: ",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                     Text(_placeDistance+' Km',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04
                    ),
                    )
                  ],
                ),
            ),
               Padding(
                padding: const EdgeInsets.only(top: 10,left: 8,right: 8,bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(" Bike Cost: ",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                    ),

                     Text('Pkr: '+costBike.toString(),
                    maxLines: 3,
                    style:  TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      overflow: TextOverflow.ellipsis,

                    ),
                    )
                  ],
                ),
            ),
                 Padding(
                padding: const EdgeInsets.only(top: 10,left: 8,right: 8,bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(" car Cost: ",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                    ),

                     Text('Pkr: '+costCar.toString(),
                    maxLines: 4,
                       overflow: TextOverflow.ellipsis,
                    style:  TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04
                    ),
                    )
                  ],
                ),
            ),
                  Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width*0.5,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: MaterialButton(
                    textColor: Colors.white,
                    color: const Color(0xff58BE3F),
                    shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    child: const Text(
                      'Calculate',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {

                             Fuel_efficiency=30.0;
                             double x;
                              x=double.parse(_placeDistance)  ;
                              print(x);
                              fuel= ((x / Fuel_efficiency)as double)     ;
                              costBike= fuel * fuel_price;

                          Fuel_efficiency1=10.0;
                             double y;
                              y=double.parse(_placeDistance)  ;
                              print(x);
                              fuel= ((x / Fuel_efficiency1)as double)     ;
                              costCar= fuel * fuel_price;
                     setState(() {
                              costCar;
                             costBike;
                           });

                    },
                  ),
                ),

                            ],
                          )
                         ),
                       )
                  ],
                ),
               ),
             ),
             Divider(height: 1, thickness: 1, color: Colors.blueGrey[200]),
             const Padding(
               padding: EdgeInsets.all(15.0),
               child: Text(" Enter More Data: ",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff58BE3F),
                    ),
                    ),
             ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: Province,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff58BE3F)),
                  ),focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                        color: Color(0xff58BE3F),
                                          ),
                                        ),
                  labelText: 'My Province',
                   labelStyle: TextStyle(
                    color: Color(0xff58BE3F),
                  )
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: city,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color:Color(0xff58BE3F)),
                  ), focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                        color: Color(0xff58BE3F),
                                          ),
                                        ),
                  labelText: 'City/Area ',
                  labelStyle: TextStyle(
                    color: Color(0xff58BE3F),
                  )
                ),
              ),
               const SizedBox(height: 16.0),
              TextFormField(
                controller: Number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff58BE3F)),
                  ),focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                        color: Color(0xff58BE3F),
                                          ),
                                        ),
                  labelText: 'Number',
                   labelStyle: TextStyle(
                    color: Color(0xff58BE3F),
                  )
                ),
              ),
               Container(
        width: 300,
        height: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                const Text(
                  'Choose Date',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      letterSpacing: 0.5),
                ),
                InkWell(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: Container(
                    width: _width / 1.7,
                    height: _height / 9,
                    margin: const EdgeInsets.only(top: 30),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.grey[200]),
                    child: TextFormField(
                      style: const TextStyle(fontSize: 40),
                      textAlign: TextAlign.center,
                      enabled: false,
                      keyboardType: TextInputType.text,
                      controller: _dateController,
                      onSaved: (val) {
                        _setDate = val!;
                      },
                      decoration: const InputDecoration(
                          disabledBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                          // labelText: 'Time',
                          contentPadding: EdgeInsets.only(top: 0.0)),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                const Text(
                  'Choose Time',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      letterSpacing: 0.5),
                ),
                InkWell(
                  onTap: () {
                    _selectTime(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 30),
                    width: _width / 1.7,
                    height: _height / 9,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.grey[200]),
                    child: TextFormField(
                      style: const TextStyle(fontSize: 40),
                      textAlign: TextAlign.center,
                      onSaved: (val) {
                        _setTime = val!;
                      },
                      enabled: false,
                      keyboardType: TextInputType.text,
                      controller: _timeController,
                      decoration: const InputDecoration(
                          disabledBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                          // labelText: 'Time',
                          contentPadding: EdgeInsets.all(5)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      Divider(height: 3, thickness: 1, color: Colors.blueGrey[200]),
            const SizedBox(height: 40,),
            const Center(
              child: Text("Map Screenshot",style: TextStyle(
                  color: Color(0xff58BE3F),
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
      
              ),),
            ),
               Padding(
                    padding:  const EdgeInsets.all(10.0),
                    child: Container(
                      width: 430,
                      height: 500,
                      color: Colors.white ,
                      child: Center(
                        child: Image.network(image,
                         fit: BoxFit.fitWidth,
                         ),
                      ),
                    ),
                  ),
           
             // SizedBox(height: 16.0),
               Container(
                height: 50,
                width: 400,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: MaterialButton(
                  textColor: Colors.white,
                  color: const Color(0xff58BE3F),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: const Text(
                    'Save',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
    
                   storeUserInfo();
                       //  storeUserInfo();
                         Get.to(()=>  const savepostU());
                      //  uploadImage(_image!);
                      // Get.to(ChossScreen());
                    
                    
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
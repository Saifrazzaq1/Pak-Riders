import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import '../constants.dart';

class AddMainatain extends StatefulWidget {
  const AddMainatain({super.key});

  @override
  State<AddMainatain> createState() => _AddMainatainState();
}

class _AddMainatainState extends State<AddMainatain> {
  late String _setTime, _setDate;

  late double _height;
  late double _width;

  late String _hour, _minute, _time;

  late String dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = const TimeOfDay(hour: 00, minute: 00);
  TextEditingController _selectedItemController = TextEditingController();
  List<String> items = [
    'Re-Fueling',
    'Oil Replacement',
    'Tyres',
    'Tune UPs',
    'Others'
  ];
  // TextEditingController Service = TextEditingController();
  TextEditingController Costpkr = TextEditingController();
  TextEditingController Milage = TextEditingController();
  TextEditingController Notes = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _dateController1 = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  Future<void> _selectDate1(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime.now(), // Start from today
      lastDate: DateTime(2101),
      currentDate: DateTime.now(), // Preselect today's date
    );

    if (picked != null &&
        picked.isAfter(DateTime.now().subtract(Duration(days: 1)))) {
      setState(() {
        _dateController.text = DateFormat.yMd().format(picked);
      });
    }
  }

  Future<void> _selectDate2(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime.now(), // Start from today
      lastDate: DateTime(2101),
      currentDate: DateTime.now(), // Preselect today's date
    );

    if (picked != null &&
        picked.isAfter(DateTime.now().subtract(Duration(days: 1)))) {
      setState(() {
        _dateController1.text = DateFormat.yMd().format(picked);
      });
    }
  }

  // Future<Null> _selectTime(BuildContext context) async {
  //   final TimeOfDay? picked = await showTimePicker(
  //     context: context,
  //     initialTime: selectedTime,
  //   );
  //   if (picked != null)
  //     setState(() {
  //       selectedTime = picked;
  //       _hour = selectedTime.hour.toString();
  //       _minute = selectedTime.minute.toString();
  //       _time = _hour + ' : ' + _minute;
  //       _timeController.text = _time;
  //       _timeController.text = formatDate(
  //           DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
  //           [hh, ':', nn, " ", am]).toString();
  //     });
  // }

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String plate = 'Loading...';
  String platenum = 'Loading...';
  String model = 'Loading..';
  String type = 'Loading';
  String image = 'Loading...';
  String image1 = 'Loading...';
  String image2 = 'Loading...';
  void getData() async {
    User? user = await FirebaseAuth.instance.currentUser;
    // var vari= await FirebaseFirestore.instance.collection('users').doc(user?.uid).get();
    var vari = await FirebaseFirestore.instance
        .collection('vehicle')
        .doc(user?.uid)
        .get();
    setState(() {
      plate = vari.data()!['plate'];
      platenum = vari.data()!['platenum'];
      model = vari.data()!['model'];
      type = vari.data()!['type'];
    });
  }

  storeUserInfo() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance.collection('Maintaince').doc(uid).set({
      'Servicedate': _dateController.text,
      'Item': _selectedItemController.text,
      'Milage': Milage.text,
      'Note': Notes.text,
      'costpkr': Costpkr.text,
      'Nextdate': _dateController1.text,
      //  'start': startAddressController.text,
      //  'destination': destinationAddressController.text,
      //  'distance': _placeDistance.toString(),
    }).whenComplete(() => Utils().toastMessage('Upload Successfully'));
  }

  @override
  void initState() {
    _dateController.text = DateFormat.yMd().format(DateTime.now());

    _timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    //  getRData();
    getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Maintaince Details'),
          backgroundColor: const Color(0xff58BE3F),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
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
              Column(
                children: <Widget>[
                  Center(
                    child: Text(
                      "Other Details",
                      style: TextStyle(
                        color: Color(0xff58BE3F),
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Service Date',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        letterSpacing: 0.5),
                  ),
                  InkWell(
                    onTap: () {
                      _selectDate1(context);
                    },
                    child: Container(
                      width: _width / 1.7,
                      height: _height / 9,
                      margin: const EdgeInsets.only(top: 10),
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
                            disabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            // labelText: 'Time',
                            contentPadding: EdgeInsets.only(top: 0.0)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField<String>(
                    value: _selectedItemController.text.isEmpty
                        ? null
                        : _selectedItemController.text,
                    items: items.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItemController.text = newValue ?? '';
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Select an item',
                      labelStyle: TextStyle(
                        color: Color(0xff58BE3F),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff58BE3F)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff58BE3F),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text('Selected Item: ${_selectedItemController.text}'),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: Costpkr,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff58BE3F)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff58BE3F),
                          ),
                        ),
                        labelText: 'Cost (PKR)',
                        labelStyle: TextStyle(
                          color: Color(0xff58BE3F),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: Milage,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff58BE3F)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff58BE3F),
                          ),
                        ),
                        labelText: 'Current Milage (KM)',
                        labelStyle: TextStyle(
                          color: Color(0xff58BE3F),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: Notes,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff58BE3F)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff58BE3F),
                          ),
                        ),
                        labelText: 'Service Notes',
                        labelStyle: TextStyle(
                          color: Color(0xff58BE3F),
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              const Text(
                ' Next Service Date',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    letterSpacing: 0.5),
              ),
              InkWell(
                onTap: () {
                  _selectDate2(context);
                },
                child: Container(
                  width: _width / 1.7,
                  height: _height / 9,
                  margin: const EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  child: TextFormField(
                    style: const TextStyle(fontSize: 40),
                    textAlign: TextAlign.center,
                    enabled: false,
                    keyboardType: TextInputType.text,
                    controller: _dateController1,
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
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.4,
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

                    //  uploadImage(_image!);
                    // Get.to(ChossScreen());
                  },
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

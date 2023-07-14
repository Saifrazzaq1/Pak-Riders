import 'dart:io';
import 'dart:io';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:pakriders/constants.dart';

class VehicleDetailsScreen extends StatefulWidget {
  const VehicleDetailsScreen({super.key});

  @override
  State<VehicleDetailsScreen> createState() => _VehicleDetailsScreenState();
}

class _VehicleDetailsScreenState extends State<VehicleDetailsScreen> {
  final _formkey = GlobalKey<FormState>();
  bool showPassword = false;

  TextEditingController plateController = TextEditingController();
  TextEditingController platenumController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  //sfinal  imgurl=await uploadImage(_image!);
  File? image;
  File? image1;
  File? image2;
  String? imgurl;
  String? imgurl1;
  String? imgurl2;
  final picker = ImagePicker();
  final picker1 = ImagePicker();
  final picker2 = ImagePicker();
  // get reference => null;

  storeUserInfo() async {
    // final imgurl =await uploadImage(_image!);
    String uid = FirebaseAuth.instance.currentUser!.uid;
    String imgId = DateTime.now().microsecondsSinceEpoch.toString();
    final storeImage =
        FirebaseStorage.instance.ref().child('images').child('Rider$imgId');
    var task = storeImage.putFile(image!);
    final storeImage1 =
        FirebaseStorage.instance.ref().child('images1').child('Rider$imgId');
    var task1 = storeImage1.putFile(image1!);
    final storeImage2 =
        FirebaseStorage.instance.ref().child('images2').child('Rider$imgId');
    var task2 = storeImage2.putFile(image2!);
    imgurl = await (await task.whenComplete(() => null)).ref.getDownloadURL();
    imgurl1 = await (await task1.whenComplete(() => null)).ref.getDownloadURL();
    imgurl2 = await (await task2.whenComplete(() => null)).ref.getDownloadURL();
    FirebaseFirestore.instance.collection('vehicle').doc(uid).set({
      'plate': plateController.text,
      'platenum': platenumController.text,
      'model': modelController.text,
      'type': typeController.text,
      'Selfi': imgurl2.toString(),
      'CNIC': imgurl.toString(),
      'Vehicle card': imgurl1.toString(),
    }).then((value) {
      // nameController.clear();
      // emailController.clear();
      // passController.clear();
      // addressController.clear();
      //Get.to(()=> ChossScreen());
    }).whenComplete(() => Utils().toastMessage('Registered Successfully'));
  }

  Future imagePicker() async {
    final img = await picker.pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      image = File(img!.path);
    });
  }

  Future imagePicker1() async {
    final img1 = await picker1.pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      image1 = File(img1!.path);
    });
  }

  Future imagePicker2() async {
    final img2 = await picker2.pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      image2 = File(img2!.path);
    });
  }

  @override
  void initState() {
    //  getRData();

    // imagePicker();
    // imagePicker1();
    // imagePicker2();
    //storeUserInfo();
    super.initState();
  }
  //  File? _image;
  //     File? _image1;
  //        File? _image2;
  //       // String? downloadUrl;
  //    final picker = ImagePicker();
  //    Future imagePicker() async {
  //     try{
  //        final pick=await picker.pickImage( source: ImageSource.camera,);
  //    setState(() {
  //      if(pick!=null ){
  //       _image =File(pick.path);
  //      } else{
  //       const Text('no image selected');
  //      }
  //    });
  //    }catch(e){
  //      Text(e.toString());
  //    }

  //    }
  //    Future imagePicker1() async {
  //     try{
  //        final pick1=await picker.pickImage( source: ImageSource.camera,);
  //    setState(() {
  //      if( pick1!=null){
  //       _image1 =File(pick1.path);
  //      } else{
  //       const Text('no image selected');
  //      }
  //    });
  //    }catch(e){
  //      Text(e.toString());
  //    }

  //    }
  //    Future imagePicker2() async {
  //     try{
  //        final pick2=await picker.pickImage( source: ImageSource.camera,);
  //    setState(() {
  //      if(pick2!=null ){

  //       _image2 =File(pick2.path);
  //      } else{
  //       const Text('no image selected');
  //      }
  //    });
  //    }catch(e){
  //      Text(e.toString());
  //    }

  //    }
  //    Future uploadImage(File _image)async{
  //     String url;
  //     String imgId= DateTime.now().microsecondsSinceEpoch.toString();
  //     Reference ref= await FirebaseStorage.instance.ref().child('images').child('Rider$imgId');
  //     ref.putFile(_image);
  //     // ref.putFile(_image1!);
  //     // ref.putFile(_image2!);
  //     url= await ref.getDownloadURL();
  //     return url;
  //    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Vehicle Registration')),
        backgroundColor: const Color(0xff58BE3F),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formkey,
          child: Center(
            child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    '1. Vehicle Details',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      autocorrect: true,
                      // maxLength: 40,
                      controller: plateController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Alphabets e.g  Abv";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: "Plate Alpha",
                        labelStyle: TextStyle(
                          color: Color(0xff58BE3F),
                        ), //<-- SEE HER),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff58BE3F),
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.name,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter(RegExp(r'[a-zA-Z]+|\s'),
                            allow: true)
                      ], // Only numbers can be entered
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      autocorrect: true,
                      obscureText: false,
                      maxLength: 8,
                      controller: platenumController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter numbers e.g 8058";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: "Plate Num",
                        labelStyle: TextStyle(
                          color: Color(0xff58BE3F),
                        ), //<-- SEE HER),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff58BE3F),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      autocorrect: true,
                      obscureText: false,
                      maxLength: 4,
                      controller: modelController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Model number e.g 2023";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: "Model #",
                        labelStyle: TextStyle(
                          color: Color(0xff58BE3F),
                        ), //<-- SEE HER),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff58BE3F),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      autocorrect: true,
                      // maxLength: 40,
                      controller: typeController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Type e.g  Bike/ Car";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: " bike/ car ",
                        labelStyle: TextStyle(
                          color: Color(0xff58BE3F),
                        ), //<-- SEE HER),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff58BE3F),
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.name,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter(RegExp(r'[a-zA-Z]+|\s'),
                            allow: true)
                      ], // Only numbers can be entered
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    '2. CNIC Card',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 330,
                      height: 250,
                      color: Colors.black12,
                      child: Center(
                        child: Row(
                          children: [
                            Expanded(
                                child: image == null
                                    ? const Center(
                                        child: Text('no image selected'))
                                    : Image.file(image!)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff58BE3F)),
                    ),
                    onPressed: () {
                      imagePicker();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Upload CNIC'), // <-- Text
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.camera_alt_outlined,
                          size: 24.0,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    '3. Vehicle Card',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 330,
                      height: 250,
                      color: Colors.black12,
                      child: Center(
                        child: Row(
                          children: [
                            Expanded(
                                child: image1 == null
                                    ? const Center(
                                        child: Text('no image selected'))
                                    : Image.file(image1!)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff58BE3F)),
                    ),
                    onPressed: () {
                      imagePicker1();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Upload Vehicle card'), // <-- Text
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.camera_alt_outlined,
                          size: 24.0,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    '4. Selfi Photo',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 330,
                      height: 250,
                      color: Colors.black12,
                      child: Center(
                        child: Row(
                          children: [
                            Expanded(
                                child: image2 == null
                                    ? const Center(
                                        child: Text('no image selected'))
                                    : Image.file(image2!)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    // ignore: prefer_const_constructors
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff58BE3F)),
                    ),
                    onPressed: () {
                      imagePicker2();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Upload Selfi'), // <-- Text
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.camera_alt_outlined,
                          size: 24.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
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
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          storeUserInfo();
                          //  uploadImage(_image!);
                          // Get.to(ChossScreen());
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ]),
          ),
        ),
      ),
    );
  }
}

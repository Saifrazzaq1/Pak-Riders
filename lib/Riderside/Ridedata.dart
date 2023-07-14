import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:pakriders/constants.dart';
import 'package:path_provider/path_provider.dart';

class PostdataR extends StatefulWidget {
  const PostdataR({super.key});

  @override
  State<PostdataR> createState() => _PostdataRState();
}

class _PostdataRState extends State<PostdataR> {
  ScreenshotController screenshotController = ScreenshotController();
   
  File? mapshot;
     String? imgurL;
     final picker = ImagePicker();
      storeUserInfo()async{
       // final imgurl =await uploadImage(_image!);
  String uid= FirebaseAuth.instance.currentUser!.uid;
  String imgId= DateTime.now().microsecondsSinceEpoch.toString();
 final storeImage =FirebaseStorage.instance.ref().child('mapshot').child('Map$imgId');
 var task = storeImage.putFile(mapshot!) ;
 
 imgurL =await (await task.whenComplete(() => null)).ref.getDownloadURL();


  FirebaseFirestore.instance.collection('Mapshot').doc(uid).set({
  
   'mapshot': imgurL.toString(),

    

  }).then((value) {
  // nameController.clear();
  // emailController.clear();
  // passController.clear();
  // addressController.clear();
  //Get.to(()=> ChossScreen());
  }
  ).whenComplete(() => Utils().toastMessage('Upload Successfully') );
  
}
Future imagePicker()async{
         final img= await picker.pickImage( source: ImageSource.gallery);
         setState(() {
           mapshot= File(img!.path); 
         });
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Screenshot(
           
            controller: ScreenshotController(),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 230,
                        height: 500,
                        color: Colors.black12 ,
                        child: Center(
                          child: Row(
                            children: [
                              Expanded(child: mapshot==null
                              ? const Center(child: Text('no image selected'))
                              : Image.file(mapshot!)

                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                 ElevatedButton(
                       style: ButtonStyle(
                        backgroundColor:MaterialStateProperty.all(Color(0xff58BE3F)),
                      ),
                        onPressed: () {
                                        imagePicker();

                                          },
                                 child: Row(
                       mainAxisSize: MainAxisSize.min,
                      children: [
                      const Text('Upload Map Screenshot'), // <-- Text
                        const SizedBox(
                        width: 5,
                        ),
                        const Icon( Icons.camera_alt_outlined,
                          size: 24.0,
                           ),
                                 ],
                           ),
                          ),
                          SizedBox(
                            height: 30,
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
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {


                           storeUserInfo();
                           Get.to(()=> const Moreridedata());
                        //  uploadImage(_image!);
                        // Get.to(ChossScreen());


                    },
                  ),
                ),

                      ],  ),
            ),
        
            ),
      ),
         );
    
  }
}
// void _takeScreenshotAndSave() async {
//   try {
//     final imageFile = await FlutterNativeScreenshot.takeScreenshot();
//     final result = await ImageGallerySaver.saveFile(imageFile!.path);
//     print('Image saved to gallery: $result');
//   } catch (e) {
//     print('Error saving screenshot to gallery: $e');
//   }
// }
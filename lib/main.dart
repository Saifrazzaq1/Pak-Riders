
import 'package:pakriders/constants.dart';

import 'Riderside/RiderProf.dart';


// Future<void> backgroundHandler(RemoteMessage message) async {
//   	print(message.data.toString());
//  	print(message.notification!.title);
// 	}
void main() async {

 WidgetsFlutterBinding.ensureInitialized();


  await  Firebase.initializeApp(
    //  options:  const FirebaseOptions(
    //   apiKey:'AIzaSyBRwCx_7VDQjaOY2pKEoaGEDQxDoPReD2E', // Your apiKey
    //   appId: '1:773400151234:web:7cce499908c0158539a75b',
    //   messagingSenderId: '773400151234',// Your messagingSenderId
    //   projectId: 'pak-riders',
    // ),
   
   );
   
  //     FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  //  localNotificationService.initialize();
   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

     debugShowCheckedModeBanner: false,
      home: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ChossScreen();
        } else {
          return SplashScreen();
        }
      },
    )
    );
  }
}

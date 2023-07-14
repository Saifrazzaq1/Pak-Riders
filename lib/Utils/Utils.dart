import 'package:pakriders/constants.dart';
class Utils{
  void toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM_LEFT,
        timeInSecForIosWeb: 1,
        backgroundColor: Color(0xff58BE3F),
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}
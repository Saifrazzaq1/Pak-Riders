import 'constants.dart';

class IntroScreen extends StatelessWidget {
  var text;

  IntroScreen({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 70,
                ),
                const Text(
                  'Hello, nice to meet you!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Get a new experience with PakRiders',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(
                  height: 60,
                ),
                Center(child: Image.asset('images/4.jpg')),
                const SizedBox(
                  height: 80,
                ),
                Center(
                  child: Container(
                    width: 330, // <-- match_parent
                    height: 50,
                    //
                    child: MaterialButton(
                      textColor: Colors.white,
                      color: const Color(0xff58BE3F),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Get.to(() => LoginForm());
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text(
                        'Login with social media?',
                        // textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 15, color: Colors.black87),
                      ),
                    ),
                    Center(
                      child: GestureDetector(
                        child: const Text(
                          'Click Here',
                          //textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff58BE3F),
                          ),
                        ),
                        onTap: () {
                          Get.to(() => Sociallogin());
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

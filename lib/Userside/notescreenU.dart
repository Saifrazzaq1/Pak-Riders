import 'package:pakriders/constants.dart';
class NotescreenU extends StatelessWidget {
  const NotescreenU({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guide Page'),
        backgroundColor: const Color(0xff58BE3F),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: const Text(
                  'Before You Continue, Here are Some Important Steps You Need to Understand:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              _buildStepTile(
                title: 'Step 1:',
                content: 'After pressing the "Agreed" button, the Google Maps screen will open with your current location. Now you need to enter the start and destination locations.',
                image: 'images/map.jpeg',
              ),
              _buildStepTile(
                title: 'Step 2:',
                content: 'Once you have entered the locations, click the "Show Route" button. It will calculate the distance in kilometers and show the route on the map.',
                image: 'images/map1.jpeg',
              ),
              _buildStepTile(
                title: 'Step 3:',
                content: 'After calculating the route, take a screenshot of the map screen. You will need to upload the screenshot on the next screen using the "Upload" button.',
                image: 'images/map2.jpeg',
              ),
              _buildStepTile(
                title: 'Step 4:',
                content: 'After uploading the screenshot, the app will display some of your data. Press the "Calculate" button to update the cost.',
                image: 'images/map3.jpeg',
              ),
              _buildStepTile(
                title: 'Step 5:',
                content: 'Once the cost is calculated, select the date and time by tapping the "Date Time" button.',
                image: 'images/map4.jpeg',
              ),
              _buildStepTile(
                title: 'Step 6:',
                content: 'After selecting the date and time, the app will display the uploaded map screenshot. Finally, click the "Save" button to save the post.',
                image: 'images/map5.jpeg',
              ),
              _buildStepTile(
                title: 'Step 7:',
                content: 'A "Thank You" screen will appear, indicating that all data has been successfully uploaded. Press the "Home" button to go back to the home screen.',
                image: 'images/map6.jpeg',
              ),
              Divider(height: 3, thickness: 1, color: Colors.blueGrey[200]),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: MaterialButton(
                    height: 40,
                    minWidth: 250,
                    color: const Color(0xff58BE3F),
                    textColor: Colors.white,
                    elevation: 10,
                    child: const Text(
                      'Agreed',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      Get.to(postu());
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

  Widget _buildStepTile({
    required String title,
    required String content,
    required String image,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            content,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 10),
          Image.asset(
            image,
            height: 400,
            width: 400,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

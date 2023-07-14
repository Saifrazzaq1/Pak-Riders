import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pakriders/constants.dart';

import 'detailsR.dart';

class Findasseng extends StatefulWidget {
  const Findasseng({Key? key}) : super(key: key);

  @override
  State<Findasseng> createState() => _FindassengState();
}

class _FindassengState extends State<Findasseng> {
  final TextEditingController _searchController = TextEditingController();
  List<QueryDocumentSnapshot> _documents = [];
  List<QueryDocumentSnapshot> _filteredDocuments = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('AllinOneU')
        .get();

    setState(() {
      _documents = snapshot.docs;
      _filteredDocuments = _documents;
    });
  }

  void _performSearch(String query) {
    final List<QueryDocumentSnapshot> filteredList = _documents
        .where((doc) =>
        doc['start'].toString().toLowerCase().contains(query.toLowerCase()))
        .toList();

    setState(() {
      _filteredDocuments = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                onChanged: _performSearch,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  hintText: 'Search...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(
                      color: Color(0xff58BE3F),
                    ),
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    color: Color(0xff58BE3F),
                  ),
                ),
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _getCrossAxisCount(constraints.maxWidth),
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 3.0,
                    ),
                    itemCount: _filteredDocuments.length,
                    itemBuilder: (BuildContext context, int index) {
                      var document = _filteredDocuments[index];
                      String imageUrl = document['profilepic'];
                      return GridTile(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            margin: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 4,
                                  offset: Offset(6, 6),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0,right: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: _getCircleAvatarRadius(constraints),
                                        backgroundImage: NetworkImage(imageUrl),
                                      ),
                                      SizedBox(
                                        height:20,
                                      ),
                                      Text(
                                        document['name'],
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.width * 0.05,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 40,
                                          ),
                                          Text(
                                            'From: ',
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context).size.width * 0.05,
                                              fontWeight: FontWeight.bold,
                                            ),

                                          ),
                                          FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              document['start'],

                                              textAlign: TextAlign.center,

                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context).size.width * 0.04,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context).size.height * 0.01,
                                          ),
                                          Text(
                                            'to: ',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context).size.width * 0.05,
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              document['destination'],
                                              textAlign: TextAlign.center,

                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context).size.width * 0.04,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context).size.height * 0.01,
                                          ),
                                           Text(
                                            'Contact:',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context).size.width * 0.05,
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              document['number'],
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              style:  TextStyle(
                                                fontSize: MediaQuery.of(context).size.width * 0.04,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),

                                          MaterialButton(
                                            textColor: Colors.white,
                                            color: Color(0xff58BE3F),
                                            child: Text('Details'),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => DetailsScreen(
                                                    userId: document.id,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  int _getCrossAxisCount(double width) {
    if (width >= 600) {
      return 2; // For tablets and larger screens
    } else {
      return 1; // For mobile devices
    }
  }

  double _getCircleAvatarRadius(BoxConstraints constraints) {
    return constraints.maxWidth >= 600 ? 90 : 70;
  }

  double _getSizedBoxHeight(BoxConstraints constraints) {
    return constraints.maxWidth >= 600 ? 10 : 5;
  }
}

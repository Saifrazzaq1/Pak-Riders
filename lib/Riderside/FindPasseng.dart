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
    final QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('AllinOneU').get();

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
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.height * 0.02,
              ),
              child: TextField(
                controller: _searchController,
                onChanged: _performSearch,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.015,
                    horizontal: MediaQuery.of(context).size.width * 0.04,
                  ),
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
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      MediaQuery.of(context).size.width < 600 ? 1 : 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 3.0,
                ),
                itemCount: _filteredDocuments.length,
                itemBuilder: (BuildContext context, int index) {
                  var document = _filteredDocuments[index];
                  String imageUrl = document['profilepic'];
                  return GridTile(
                    child: Padding(
                      padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.03,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.3,
                        margin: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.05,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 4,
                              offset: Offset(6, 6),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius:
                                        MediaQuery.of(context).size.width * 0.2,
                                    backgroundImage: NetworkImage(imageUrl),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    document['name'],
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.06,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'From: ',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          document['start'],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04, // Adjust the font size based on screen width
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      const Text(
                                        'To: ',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
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
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      const Text(
                                        'Contact:',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          document['number'],
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      MaterialButton(
                                        textColor: Colors.white,
                                        color: Color(0xff58BE3F),
                                        child: Text('Details'),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailsScreen(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

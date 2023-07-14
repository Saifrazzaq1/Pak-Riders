import '../constants.dart';

class User {
  final String name;
  final String email;
  //final String profileImageUrl;

  User({required this.name, required this.email, });
}

class vehicle {
  final String plate;
  final double model;
  final String selfi;
  final String type;
  final double platenum;

  vehicle({required this.plate, required this.model, required this.selfi,required this.type,required this.platenum});
}

class FirestoreService {
  final CollectionReference usersRef = FirebaseFirestore.instance.collection('users');
  final CollectionReference vehicleRef = FirebaseFirestore.instance.collection('vehicle');

  Stream<List<User>> getUsers() {
    return usersRef.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => User(
        name: doc['name'],
        email: doc['email'],
      //  profileImageUrl: doc['profileImageUrl'],
      )).toList();
    });
  }

  Stream<List<vehicle>> getProducts() {
    return vehicleRef.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => vehicle(
        model: doc['model'],
        plate: doc['plate'],
        selfi: doc['Selfi'],
        type: doc['type'],
        platenum: doc['platenum'],
      )).toList();
    });
  }
}

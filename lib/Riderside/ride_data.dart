// ride_data.dart

class RideData {
  String name;
  String start;
  String destination;
  String number;
  DateTime date; // Add this property

  RideData({
    required this.name,
    required this.start,
    required this.destination,
    required this.number,
    required this.date, // Initialize it in the constructor
  });
}

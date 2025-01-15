import 'package:firebase_database/firebase_database.dart';

class TheoryService {
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  DatabaseReference get theoryRef => _database.ref('Learn');

  Future<List> fetchAllTheory() async {
    DatabaseEvent event = await theoryRef.once();
    Map data = event.snapshot.value as Map;
    var allTheory = data.values.toList();
    allTheory.sort((a, b) => a['index'].compareTo(b['index']));
    return allTheory;
  }
}
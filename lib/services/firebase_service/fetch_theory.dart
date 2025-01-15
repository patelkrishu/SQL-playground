import 'package:firebase_database/firebase_database.dart';

class TheoryService {
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  DatabaseReference get theoryRef => _database.ref('Learn');

  Future<Object?> fetchAllTheory({required String of}) async {
    try {
      DatabaseEvent event = await theoryRef.child(of).once();
      return event.snapshot.value;
    } on Exception catch (e) {
      // print('++++ $e');
      return null;
    }
  }
}

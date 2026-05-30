import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HabitService {

  final _db = FirebaseFirestore.instance;

  String get _uid => FirebaseAuth.instance.currentUser!.uid;

  Future<void> addHabit(String name) async {
    await _db
        .collection('users')
        .doc(_uid)
        .collection('habits')
        .add({
          'name': name,
          'done': false,
          'createdAt': Timestamp.now(),
        });
  }

  Stream<QuerySnapshot> getHabits() {
    return _db
        .collection('users')
        .doc(_uid)
        .collection('habits')
        .snapshots();
  }

  Future<void> toggleHabit(String id, bool current) async {
    await _db
        .collection('users')
        .doc(_uid)
        .collection('habits')
        .doc(id)
        .update({
          'done': !current,
        });
  }

  Future<void> deleteHabit(String id) async {
  await _db
      .collection('users')
      .doc(_uid)
      .collection('habits')
      .doc(id)
      .delete();
}

}
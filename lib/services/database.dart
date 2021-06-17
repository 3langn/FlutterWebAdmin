import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final ref = FirebaseFirestore.instance.collection('ListMajor');

  Future postData(Map<String, dynamic> data) async {
    ref.add(data);
  }
}

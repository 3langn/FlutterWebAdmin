import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:university_admin/models/university.dart';

class DataUniversityProvider extends ChangeNotifier {
  List<University> _listUniversity = [];
  List<University> get listUniversity => _listUniversity;
  DocumentSnapshot<Object?>? _lastDocs;

  University getById(String id) =>
      _listUniversity.firstWhere((element) => element.id == id);

  Future fetchData({required int count, String? orderBy = 'maxTuition'}) async {
    late final data;

    final dataRef = FirebaseFirestore.instance.collection('ListUniversity');

    if (_lastDocs == null) {
      data = await dataRef.limit(count).get();
    } else {
      data = await dataRef.startAfterDocument(_lastDocs!).limit(10).get();
    }

    _lastDocs = await data.docs.last;
    return data;
  }

  Future fetchAndSetData({int count = 12}) async {
    final data = await fetchData(count: count);

    final listDataUniversity = University.fromDatabase(data.docs);

    _listUniversity.addAll(listDataUniversity);
    //ToDo check data from firebase
    // listDataUniversity.forEach((element) {
    //   print(
    //     element.name + ':' + element.maxTuition.toString(),
    //   );
    // });
    notifyListeners();
  }
}

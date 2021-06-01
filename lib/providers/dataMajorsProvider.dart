import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:university_admin/models/majors.dart';

class DataMajorsProvider extends ChangeNotifier {
  List<Majors> _listSelectedMajors = [];
  List<Majors> get listSelectedMajors => _listSelectedMajors;
  List<String> _listDataMajors = [];
  List<String> get listDataMajors => _listDataMajors;

  Future<void> getData() async {
    try {
      final docRef =
          await FirebaseFirestore.instance.collection('listMajors').get();
      docRef.docs.forEach((element) {
        _listDataMajors.add(element['majors']);
      });
      _listDataMajors.sort();
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  void addMajors({
    required List<String> grade,
    required String idMajors,
    required String name,
    required String studyTime,
  }) {
    _listSelectedMajors.add(
      Majors(
        grade: grade,
        idMajors: idMajors,
        name: name,
        studyTime: studyTime,
      ),
    );
    notifyListeners();
  }

  void clear() {
    _listSelectedMajors.clear();
    notifyListeners();
  }

  void removeMajors(Majors majors) {
    _listSelectedMajors.remove(majors);
    notifyListeners();
  }
}

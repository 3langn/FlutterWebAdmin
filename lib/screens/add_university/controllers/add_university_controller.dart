import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:university_admin/models/majors.dart';
import 'package:university_admin/models/university.dart';
import 'package:university_admin/ultis/constants.dart';

class AddUniversityController extends GetxController {
  final form = GlobalKey<FormState>();
  late String tenTruong;
  late String maTruong;
  late double minTuition;
  late double maxTuition;
  late String diaChi; //todo check this
  late String linkWeb;
  late String linkAnh;

  final listMajorsSelected = [].obs;
  var listMajors = [].obs;
  final isNationalUniversity = false.obs;
  Future fetchDataFromFirebase() async {
    final fb = FirebaseFirestore.instance;
    final ref = await fb.collection(FirebaseCollection.MAJOR).get();
    listMajors.addAll(Major.fromFirebase(ref.docs));
    print(listMajors.toString() + ' - Add UniversityController');
  }

  Future<void> setData() async {
    form.currentState!.save();
    final university = {
      'name': tenTruong,
      'imageUrl': linkAnh,
      'idUniversity': maTruong,
      'isNationalUniversity': isNationalUniversity,
      'listMajors': listMajorsSelected,
      'location': diaChi,
      'maxTuition': maxTuition,
      'minTuition': minTuition,
      'universityUrl': linkWeb,
    };

    final data = UniversityInfo.fromMap(university);
    UniversityInfo.toDataBase(data);
    //_form.currentState!.reset();
  }

  void addMajor({
    required List<String> grades,
    required double score,
    required String name,
    required String code,
  }) async {
    final fb = FirebaseFirestore.instance;
    final ref = fb.collection(FirebaseCollection.MAJOR);
    ref.add(
      MajorInfo.toMap(
        MajorInfo(
          grades: grades,
          score: score,
          year: DateTime.now().year,
          name: name,
          code: code,
        ),
      ),
    );
  }

  void removeMajor(MajorInfo majorInfo) {}
  @override
  void onInit() {
    fetchDataFromFirebase();
    super.onInit();
  }
}

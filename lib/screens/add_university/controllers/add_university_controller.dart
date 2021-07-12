import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:university_admin/models/majors.dart';
import 'package:university_admin/models/university.dart';
import 'package:university_admin/ultis/constants.dart';

class AddUniversityController extends GetxController {
  final form = GlobalKey<FormState>();
  var gradesSelected = [].obs;
  late List majorsId = [];
  late String tenTruong;
  late String maTruong;
  late String universityType;
  double minTuition = 0;
  double maxTuition = 0;
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

  Future setData() async {
    print('setData - adduniver_controller');
    form.currentState!.save();
    final university = {
      'name': tenTruong,
      'imageUrl': linkAnh,
      'idUniversity': maTruong,
      'isNationalUniversity': isNationalUniversity.value,
      'idMajors': ['aaaaaaa'], //majorsId as List<String>,
      'location': diaChi,
      'maxTuition': maxTuition,
      'minTuition': minTuition,
      'universityUrl': linkWeb,
      'universityType': universityType,
    };
    final data = UniversityInfo.fromMap(university);
    UniversityInfo.toDataBase(data);
    //_form.currentState!.reset();
  }

  void addMajor({required String name}) {
    listMajorsSelected.add(name);
  }

  void removeMajor(MajorInfo majorInfo) {}
  @override
  void onInit() {
    fetchDataFromFirebase();
    super.onInit();
  }
}

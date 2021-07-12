import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:university_admin/ultis/constants.dart';

import 'info.dart';

class UniversityInfo extends Info {
  final List idMajors;
  final String? idUniversity;
  final String? code;
  final String? id;
  final double? minTuition;
  final double? maxTuition;
  final String? location;
  final String? universityType;
  final String? universityUrl;
  bool isNationalUniversity;
  double rate;

  UniversityInfo({
    required name,
    required imageUrl,
    required description,
    this.id,
    this.rate = 10,
    this.idUniversity,
    required this.code,
    required this.isNationalUniversity,
    required this.idMajors,
    required this.location,
    required this.maxTuition,
    required this.minTuition,
    required this.universityType,
    required this.universityUrl,
  }) : super(
          name: name,
          imageUrl: imageUrl,
          description: description,
        );

  factory UniversityInfo.fromMap(Map<String, dynamic> mapData) {
    return UniversityInfo(
      code: mapData['code'],
      name: mapData['name'],
      imageUrl: mapData['imageUrl'],
      idUniversity: mapData['idUniversity'],
      isNationalUniversity: mapData['isNationalUniversity'],
      idMajors: mapData['idMajors'],
      location: mapData['location'],
      maxTuition: mapData['maxTuition'].toDouble(),
      minTuition: mapData['minTuition'].toDouble(),
      universityType: mapData['universityType'],
      universityUrl: mapData['universityUrl'],
      rate: 10,
      description: mapData['description'],
    );
  }

  factory UniversityInfo.fromJson(dynamic jsonData) {
    return UniversityInfo(
      code: jsonData['code'],
      name: jsonData['name'],
      imageUrl: jsonData['imageUrl'],
      idUniversity: jsonData['idUniversity'],
      isNationalUniversity: jsonData['isNationalUniversity'],
      idMajors: jsonData['idMajors'],
      location: jsonData['location'],
      maxTuition: jsonData['maxTuition'].toDouble(),
      minTuition: jsonData['minTuition'].toDouble(),
      universityType: jsonData['universityType'],
      universityUrl: jsonData['universityUrl'],
      rate: jsonData['rate'].toDouble(),
      description: jsonData['description'],
      id: jsonData.id,
    );
  }

  static fromFirebase(List<dynamic> listData) {
    return List<UniversityInfo>.from(
        listData.map((jsonData) => UniversityInfo.fromJson(jsonData)));
  }

  static toMap(UniversityInfo university) {
    final mapData = {
      'name': university.name,
      'imageUrl': university.imageUrl,
      'idUniversity': university.idUniversity,
      'isNationalUniversity': university.isNationalUniversity,
      'idMajors': university.idMajors,
      'location': university.location,
      'maxTuition': university.maxTuition,
      'minTuition': university.minTuition,
      'universityType': university.universityType,
      'universityUrl': university.universityUrl,
      'rate': university.rate,
    };

    return mapData;
  }

  static toDataBase(UniversityInfo university) async {
    final data = toMap(university);
    await FirebaseFirestore.instance
        .collection(FirebaseCollection.UNIVERSITY)
        .add(data);
  }
}

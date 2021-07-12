import 'info.dart';

class MajorInfo {
  MajorInfo({
    this.imageUniUrl,
    required this.grades,
    required this.score,
    required this.year,
    required this.name,
    required this.code,
  });
  final String? imageUniUrl;
  final String name;
  final List<String>? grades;
  final double score;
  final String code;
  final int year;

  static Map<String, dynamic> toMap(MajorInfo majorInfo) {
    return {
      'grades': majorInfo.grades,
      'score': majorInfo.score,
      'year': majorInfo.year,
      'name': majorInfo.name,
      'code': majorInfo.code,
    };
  }

  factory MajorInfo.fromJson(dynamic json) {
    return MajorInfo(
      grades: json['grades'],
      score: json['score'],
      year: json['year'],
      name: json['name'],
      imageUniUrl: json['imageUniUrl'],
      code: json['code'],
    );
  }
}

class Major extends Info {
  final String codeHtml;
  final String linkRoot;
  final bool isHot;
  final String? id;
  Major({
    required name,
    required imageUrl,
    required description,
    required this.linkRoot,
    required this.codeHtml,
    required this.isHot,
    this.id,
  }) : super(
          name: name,
          imageUrl: imageUrl,
          description: description,
        );

  factory Major.fromJson(dynamic json) {
    return Major(
      codeHtml: json['codeHtml'],
      imageUrl: json['imageUrl'],
      isHot: json['isHot'],
      name: json['majorName'],
      linkRoot: json['linkRoot'],
      description: json['description'],
      id: json.id,
    );
  }

  static fromFirebase(List data) {
    return data.map((major) => Major.fromJson(major)).toList();
  }
}

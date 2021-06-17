import 'package:get/get.dart';
import 'package:university_admin/screens/add_major/add_majors.dart';
import 'package:university_admin/screens/add_major/bindings/home_screen_bindings.dart';

class AppPages {
  static const INITIAL = Routes.ADD_MAJOR;
  static final routes = [
    GetPage(
      name: Routes.ADD_MAJOR,
      page: () => AddMajorsScreen(),
      binding: AddMajorScreenBinding(),
    ),
  ];
}

abstract class Routes {
  static const ADD_MAJOR = '/add-major';
  static const ADD_UNIVERSITY = '/add-university';
}

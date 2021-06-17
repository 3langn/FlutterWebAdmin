import 'package:get/get.dart';
import 'package:university_admin/screens/add_major/controllers/add_major_controller.dart';

class AddMajorScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddMajorController>(
      () => AddMajorController(),
    );
  }
}

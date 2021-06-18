import 'package:get/get.dart';
import 'package:university_admin/services/database.dart';
import 'package:university_admin/ultis/regrex.dart';

class AddMajorController extends GetxController {
  var codeHtml = ''.obs;
  var imageUrl = ''.obs;
  var description = ''.obs;
  var linkRoot = ''.obs;
  var majorName = ''.obs;
  var isHot = false.obs;
  FirebaseService firebaseService = FirebaseService();
  Map<String, dynamic> _toMap() {
    //
    return {
      'codeHtml': removeAllHtmlTags(codeHtml.value),
      'imageUrl': imageUrl.value,
      'description': description.value,
      'linkRoot': linkRoot.value,
      'majorName': majorName.value,
      'isHot': isHot.value,
    };
  }

  Future onSubmitTextField() async {
    firebaseService.postData(_toMap());
  }
}

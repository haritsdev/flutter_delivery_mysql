import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:udemy_flutter_delivery/src/models/Role.dart';
import 'package:udemy_flutter_delivery/src/models/user.dart';

class RolesController extends GetxController {
  User user = User.fromJson(GetStorage().read('user') ?? {});

  void goToPageRole(Role role) {
    Get.offNamedUntil(role.route!, (route) => false);
  }
}

import 'package:get/get.dart';
import 'package:pokeapi/pages/login/login_controller.dart';
import 'package:pokeapi/repositories/login_repository.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginRepository());
    Get.put(
      LoginController(repository: Get.find()),
    );
  }
}

import 'package:get/get.dart';
import 'package:pokeapi/pages/home_page/second_page_controller.dart';
import 'package:pokeapi/repositories/second_page_repository.dart';

class SecondPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SecondPageRepository());
    Get.put(SecondPageController(repository: Get.find()));
  }
}

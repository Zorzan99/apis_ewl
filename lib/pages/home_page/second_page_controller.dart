import 'package:get/get.dart';
import 'package:pokeapi/models/second_page/second_page_model.dart';
import 'package:pokeapi/repositories/second_page_repository.dart';

class SecondPageController extends GetxController with StateMixin {
  final SecondPageRepository _repository;

  SecondPageController({required SecondPageRepository repository})
      : _repository = repository;
  RxInt balance = 0.obs;
  RxInt blockedBalance = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getAccount();
  }

  Future<void> getAccount() async {
    try {
      final SecondPageModel account = await _repository.getAccount();
      balance.value = account.balance;
      blockedBalance.value = account.blockedBalance;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}

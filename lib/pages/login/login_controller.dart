import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pokeapi/application/Exception/app_exception.dart';
import 'package:pokeapi/application/token/token.dart';

import 'package:pokeapi/models/login/login_model.dart';
import 'package:pokeapi/repositories/login_repository.dart';

class LoginController extends GetxController with StateMixin {
  final TextEditingController userLoginControoler = TextEditingController();
  final TextEditingController passwordLoginController = TextEditingController();
  RxBool isLoading = false.obs;
  final GetStorage _box = GetStorage();

  final LoginRepository _repository;

  LoginController({required LoginRepository repository})
      : _repository = repository;

  Future<void> postUser() async {
    isLoading.value = true;
    final LoginModel loginModel = LoginModel(
      password: passwordLoginController.text,
      username: userLoginControoler.text,
    );
    try {
      final response = await _repository.postUser(loginModel);
      final token = response.token;
      await TokenStorage.saveToken(token);
      Get.offNamed('/secondPage');
      print('TOKEN GERADO ${TokenStorage.getToken()}');
    } on AppException catch (e) {
      Get.snackbar('Login error ', '${e.message} - ${e.code}');
    } finally {
      isLoading.value = false;
    }
  }
}

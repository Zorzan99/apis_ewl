import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokeapi/pages/login/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: controller.userLoginControoler,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                    ),
                  ),
                  TextFormField(
                    controller: controller.passwordLoginController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.postUser();
                    },
                    child: const Text('Entrar'),
                  ),
                ],
              ),
            ),
          ),

          // Indicador de progresso
          Obx(() {
            if (controller.isLoading.value) {
              return Positioned.fill(
                child: Container(
                  color: Colors.black26,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          }),
        ],
      ),
    );
  }
}

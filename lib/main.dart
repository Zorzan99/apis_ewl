import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pokeapi/pages/home_page/second_page.dart';
import 'package:pokeapi/pages/home_page/second_page_binding.dart';
import 'package:pokeapi/pages/login/login_binding.dart';
import 'package:pokeapi/pages/login/login_page.dart';

Future<void> main() async {
  await GetStorage.init();
  GetStorage().remove('token');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(
          name: '/',
          page: () => LoginPage(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: '/secondPage',
          page: () => const SecondPage(),
          binding: SecondPageBinding(),
        ),
      ],
    );
  }
}

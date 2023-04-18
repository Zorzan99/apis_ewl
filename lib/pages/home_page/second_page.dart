import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokeapi/pages/home_page/second_page_controller.dart';

class SecondPage extends GetView<SecondPageController> {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FUNCIONOU'),
      ),
      body: Column(
        children: [
          Container(
            height: 400,
            width: 400,
            decoration: const BoxDecoration(color: Colors.red),
            child: Column(
              children: [
                Obx(() {
                  return Text(controller.balance.toString());
                }),
                Obx(() {
                  return Text(controller.blockedBalance.toString());
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}

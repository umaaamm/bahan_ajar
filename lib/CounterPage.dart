import 'package:belajar/Controller/CounterController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterPage extends StatelessWidget {
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    print("Build method called");
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: Center(
        child: Obx(() => Text('Count: ${controller.counter}')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: Icon(Icons.add),
      ),
    );
  }
}
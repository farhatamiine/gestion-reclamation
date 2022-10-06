import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reclamation_controller.dart';

class ReclamationView extends GetView<ReclamationController> {
  const ReclamationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReclamationView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ReclamationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

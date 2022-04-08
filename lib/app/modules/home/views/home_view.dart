import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/constants/controllers.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'HomeView is working',
              style: TextStyle(fontSize: 20),
            ),
            TextButton(
              child: const Text('Logout'),
              onPressed: () => authController.signOut(),
            ),
          ],
        ),
      ),
    );
  }
}

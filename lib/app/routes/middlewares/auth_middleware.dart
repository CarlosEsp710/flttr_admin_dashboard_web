import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../core/constants/firebase.dart';
import '../app_pages.dart';

class AuthMiddleware extends GetMiddleware {
//   The default is 0 but you can update it to any number. Please ensure you match the priority based
//   on the number of guards you have.
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (route == Routes.AUTH && firebaseAuth.currentUser != null) {
      return const RouteSettings(name: Routes.HOME);
    }

    if (route == Routes.HOME && firebaseAuth.currentUser == null) {
      return const RouteSettings(name: Routes.AUTH);
    }

    return null;
  }
}

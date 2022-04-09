import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../core/constants/firebase.dart';
import '../app_pages.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (route == Routes.AUTH && firebaseAuth.currentUser != null) {
      return const RouteSettings(name: Routes.DASHBOARD);
    }

    if (route == Routes.DASHBOARD && firebaseAuth.currentUser == null) {
      return const RouteSettings(name: Routes.AUTH);
    }

    return null;
  }
}

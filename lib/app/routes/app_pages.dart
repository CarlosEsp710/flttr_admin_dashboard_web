import 'package:get/get.dart';

import '../core/utils/helpers/no_page_found.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

import 'middlewares/auth_middleware.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;
  static const NOT_FOUND = Routes.NOT_FOUND;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.noTransition,
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
      transition: Transition.noTransition,
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.NOT_FOUND,
      page: () => const NoPageFound(),
      transition: Transition.noTransition,
    ),
  ];
}

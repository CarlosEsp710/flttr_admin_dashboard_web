import 'package:get/get.dart';

import '../../../core/constants/app_constants.dart';

class AuthController extends GetxController {
  RxBool isLoginWidgetDisplayed = true.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    logger.i('AuthController onInit');
  }

  @override
  void onReady() {
    super.onReady();
    logger.i('AuthController onReady');
  }

  @override
  void onClose() {}

  changeDIsplayedAuthWidget() =>
      isLoginWidgetDisplayed.value = !isLoginWidgetDisplayed.value;
}

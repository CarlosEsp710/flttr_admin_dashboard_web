import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../core/constants/firebase.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  late Rx<User?> firebaseUser;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(firebaseAuth.currentUser);
    firebaseUser.bindStream(firebaseAuth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAllNamed(Routes.AUTH);
    } else {
      Get.offAllNamed(Routes.HOME);
    }
  }

  @override
  void onClose() {}
}

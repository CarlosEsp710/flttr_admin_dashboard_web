import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../core/constants/firebase.dart';
import '../../../routes/app_pages.dart';

class AuthController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  late Rx<User?> firebaseUser;
  RxBool isLoggedIn = false.obs;
  RxBool isLoginWidgetDisplayed = true.obs;

  String usersCollection = "users";

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

  changeDIsplayedAuthWidget() =>
      isLoginWidgetDisplayed.value = !isLoginWidgetDisplayed.value;

  void signUp() async {
    try {
      await firebaseAuth
          .createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      )
          .then((result) {
        String _userId = result.user!.uid;
        _addUserToFirestore(_userId);
        // _initializeUserModel(_userId);
        _clearControllers();
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Sign In Failed", "Try again");
    }
  }

  _addUserToFirestore(String userId) {
    firebaseFirestore.collection(usersCollection).doc(userId).set({
      "name": name.text.trim(),
      "id": userId,
      "email": email.text.trim(),
      "cart": []
    });
  }

  _clearControllers() {
    name.clear();
    email.clear();
    password.clear();
  }
}

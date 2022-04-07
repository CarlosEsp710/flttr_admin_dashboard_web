import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/constants/firebase.dart';

class AuthController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  RxBool isLoginWidgetDisplayed = true.obs;

  String usersCollection = "users";

  changeDIsplayedAuthWidget() =>
      isLoginWidgetDisplayed.value = !isLoginWidgetDisplayed.value;

  void signIn() async {
    try {
      await firebaseAuth
          .signInWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      )
          .then((result) {
        _clearControllers();
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

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
        _clearControllers();
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  _addUserToFirestore(String userId) {
    firebaseFirestore.collection(usersCollection).doc(userId).set({
      "name": name.text.trim(),
      "id": userId,
      "email": email.text.trim(),
    });
  }

  _clearControllers() {
    name.clear();
    email.clear();
    password.clear();
  }
}

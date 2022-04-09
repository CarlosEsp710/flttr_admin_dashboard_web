import 'package:admin_dashboard/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/firebase.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  RxBool isLoginWidgetDisplayed = true.obs;

  late Rx<User?> firebaseUser;

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
      // userModel.bindStream(listenToUser());
      Get.offAllNamed(Routes.HOME);
    }
  }

  void signIn() async {
    if (loginFormKey.currentState!.validate()) {
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
        logger.e(e.toString());
      }
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      logger.e(e.toString());
    }

    return null;
  }

  void signUp() async {
    if (registerFormKey.currentState!.validate()) {
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
        logger.e(e.toString());
      }
    }
  }

  void signOut() async => await firebaseAuth.signOut();

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

  changeDIsplayedAuthWidget() =>
      isLoginWidgetDisplayed.value = !isLoginWidgetDisplayed.value;
}

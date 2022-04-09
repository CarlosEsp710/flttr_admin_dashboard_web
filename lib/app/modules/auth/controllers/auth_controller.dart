import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/firebase.dart';
import '../../../routes/app_pages.dart';

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

  void signInWithGoogle() async {
    try {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();

      googleProvider
          .addScope('https://www.googleapis.com/auth/contacts.readonly');
      googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

      await firebaseAuth.signInWithPopup(googleProvider).then(
        (result) {
          String _userId = result.user!.uid;
          _addUserToFirestore(
            _userId,
            displayName: result.user!.displayName,
            displayEmail: result.user!.email,
          );
        },
      );
    } catch (e) {
      logger.e(e.toString());
    }
  }

  void signInWithFacebook() async {
    try {
      FacebookAuthProvider facebookProvider = FacebookAuthProvider();

      facebookProvider.addScope('email');
      facebookProvider.setCustomParameters({
        'display': 'popup',
      });

      await firebaseAuth.signInWithPopup(facebookProvider).then(
        (result) {
          String _userId = result.user!.uid;
          _addUserToFirestore(
            _userId,
            displayName: result.user!.displayName,
            displayEmail: result.user!.email,
          );
        },
      );
    } catch (e) {
      logger.e(e.toString());
    }
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
          firebaseAuth.currentUser!.updateDisplayName(name.text.trim());
          _addUserToFirestore(_userId);
          _clearControllers();
        });
      } catch (e) {
        logger.e(e.toString());
      }
    }
  }

  void signOut() async => await firebaseAuth.signOut();

  _addUserToFirestore(
    String userId, {
    String? displayName,
    String? displayEmail,
  }) async {
    firebaseFirestore.collection(usersCollection).doc(userId).set({
      "name": displayName ?? name.text.trim(),
      "id": userId,
      "email": displayEmail ?? email.text.trim(),
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

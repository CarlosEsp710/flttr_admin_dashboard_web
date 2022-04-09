import 'package:flutter/material.dart';

import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../../../core/constants/controllers.dart';
import '../../../core/theme/text_form_theme.dart';

import 'link_text_widget.dart';
import 'button_widget.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 60),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 370),
          child: Form(
            key: authController.loginFormKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: authController.email,
                  decoration: WebTextFormField().inputDecoration(
                    label: 'Email',
                    hint: 'Ingrese su correo',
                    icon: Icons.email_outlined,
                  ),
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese algun texto';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: authController.password,
                  decoration: WebTextFormField().inputDecoration(
                    label: 'Password',
                    hint: 'Ingrese su contraseña',
                    icon: Icons.lock_outline,
                  ),
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese algun texto';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ButtonWidget(
                  text: 'Ingresar',
                  onPressed: () => authController.signIn(),
                ),
                const SizedBox(height: 20),
                // Or sign up with google
                const Text('O', style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 5),
                SignInButton(
                  Buttons.Google,
                  onPressed: () => authController.signInWithGoogle(),
                ),
                const SizedBox(height: 5),
                SignInButton(
                  Buttons.Facebook,
                  onPressed: () => authController.signInWithFacebook(),
                ),
                const SizedBox(height: 20),
                LinkTextWidget(
                  text: 'Nueva cuenta',
                  color: Colors.blue,
                  onTap: () => authController.changeDIsplayedAuthWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../core/constants/controllers.dart';
import '../../../core/theme/text_form_theme.dart';

import 'link_text_widget.dart';
import 'button_widget.dart';

class RegisterWidget extends StatelessWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 45),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 370),
          child: Form(
            key: authController.registerFormKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: authController.name,
                  decoration: WebTextFormField().inputDecoration(
                    label: 'Nombre',
                    hint: 'Ingrese su nombre',
                    icon: Icons.person_outline,
                  ),
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese algun texto';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
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
                  text: 'Crear cuenta',
                  onPressed: () => authController.signUp(),
                ),
                const SizedBox(height: 20),
                LinkTextWidget(
                  text: 'Ya tengo una cuenta',
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

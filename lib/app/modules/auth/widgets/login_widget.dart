import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/theme/text_form_theme.dart';
import '../controllers/auth_controller.dart';
import 'link_text_widget.dart';
import 'button_widget.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController _controller = Get.find();

    return Container(
      margin: const EdgeInsets.only(top: 100),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 370),
          child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
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
                  onPressed: () {},
                ),
                const SizedBox(height: 20),
                LinkTextWidget(
                  text: 'Nueva cuenta',
                  color: Colors.blue,
                  onTap: () => _controller.changeDIsplayedAuthWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

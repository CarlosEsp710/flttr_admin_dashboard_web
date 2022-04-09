import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../widgets/background_widget.dart';
import '../widgets/custom_title_widget.dart';
import '../widgets/links_widget.dart';
import '../widgets/login_widget.dart';
import '../widgets/register_widget.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: <Widget>[
          size.width <= 1000 ? const _MobileBody() : const _DesktopBody(),
          const LinksWidget(),
        ],
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  const _DesktopBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final AuthController _controller = Get.find();

    return SizedBox(
      width: size.width,
      height: size.height * 0.95,
      child: Row(
        children: <Widget>[
          const Expanded(child: BackgroundTwitter()),
          Container(
            width: 600,
            height: double.infinity,
            color: Colors.black,
            child: Column(
              children: <Widget>[
                const CustomTitleWidget(),
                const SizedBox(height: 50),
                Obx(
                  () => Expanded(
                    child: _controller.isLoginWidgetDisplayed.value
                        ? const LoginWidget()
                        : const RegisterWidget(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileBody extends StatelessWidget {
  const _MobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController _controller = Get.find();

    return Container(
      //height: 1000,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const CustomTitleWidget(),
          const SizedBox(height: 50),
          SizedBox(
            width: double.infinity,
            height: 420,
            child: Obx(
              () => _controller.isLoginWidgetDisplayed.value
                  ? const LoginWidget()
                  : const RegisterWidget(),
            ),
          ),
          const SizedBox(height: 50),
          const SizedBox(
            width: double.infinity,
            height: 400,
            child: BackgroundTwitter(),
          ),
        ],
      ),
    );
  }
}

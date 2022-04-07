import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/core/constants/app_constants.dart';
import 'app/core/constants/firebase.dart';
import 'app/modules/splash/controllers/splash_controller.dart';
import 'app/core/theme/text_theme.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialization.then((_) {
    Get.put<SplashController>(SplashController());
    logger.i('Firebase initialized successfully');
  });

  runApp(const MyWebApp());
}

class MyWebApp extends StatelessWidget {
  const MyWebApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Flutter Web Dashboard",
      initialRoute: Routes.AUTH,
      getPages: AppPages.routes,
      unknownRoute: AppPages.routes.last,
      theme: ThemeData(
        textTheme: WebTextTheme().textTheme(context),
      ),
    );
  }
}

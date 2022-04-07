import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/core/constants/app_constants.dart';
import 'app/core/constants/firebase.dart';
import 'app/core/theme/text_theme.dart';
import 'app/routes/app_pages.dart';
import 'app/core/utils/helpers/no_page_found.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialization.then((_) {
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
      unknownRoute: GetPage(
        name: '/404',
        page: () => const NoPageFound(),
        transition: Transition.noTransition,
      ),
      theme: ThemeData(
        textTheme: WebTextTheme().textTheme(context),
      ),
    );
  }
}

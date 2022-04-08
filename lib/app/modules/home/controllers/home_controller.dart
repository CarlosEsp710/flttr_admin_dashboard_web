import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  //TODO: Implement HomeController

  final count = 0.obs;

  @override
  void onClose() {}
  void increment() => count.value++;
}

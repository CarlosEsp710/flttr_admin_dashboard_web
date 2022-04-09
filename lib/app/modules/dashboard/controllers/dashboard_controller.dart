import 'package:get/get.dart';

class DashboardController extends GetxController {
  static DashboardController instance = Get.find();
  //TODO: Implement HomeController

  final count = 0.obs;

  @override
  void onClose() {}
  void increment() => count.value++;
}

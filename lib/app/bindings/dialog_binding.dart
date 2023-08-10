import 'package:get/get.dart';
import '../controllers/dialog_controller.dart';

class DialogBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DialogController>(() => DialogController());
  }
}
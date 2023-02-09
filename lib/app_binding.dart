import 'package:club_assignment/controllers/form_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FormController(), fenix: true);
  }
}

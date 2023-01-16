import 'package:club_assignment/controllors/from_controllor.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FormControllor());
  }
}

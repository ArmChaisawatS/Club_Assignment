import 'package:club_assignment/models/from_model.dart';
import 'package:get/get.dart';

class FormControllor extends GetxController {
  List<FormModel> froms = List<FormModel>.empty().obs;

  void addForm(FormModel form) {
    froms.add(form);
  }

  void removeFrom(int index) {
    froms.removeAt(index);
  }
}

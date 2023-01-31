import 'package:club_assignment/models/club_model.dart';
import 'package:club_assignment/models/form_model.dart';
import 'package:get/get.dart';

class FormControllor extends GetxController {
  List<FormModel> forms = List<FormModel>.empty().obs;
  List<ClubModel> clubs = List<ClubModel>.empty().obs;
  List<MemberModel> members = List<MemberModel>.empty().obs;
  List<HobbyModel> hobbys = List<HobbyModel>.empty().obs;

  void addForm(FormModel form) {
    forms.add(form);
  }

  void removeForm(int index) {
    forms.removeAt(index);
  }

  void addClubname(ClubModel clubModel) {
    clubs.add(clubModel);
  }

  void addMember(MemberModel memberModel) {
    members.add(memberModel);
  }

  void addHobby(HobbyModel hobbyModel) {
    hobbys.add(hobbyModel);
  }
}

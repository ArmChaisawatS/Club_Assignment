import 'package:club_assignment/models/club_model.dart';
import 'package:club_assignment/models/form_model.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  List<FormModel> forms = List<FormModel>.empty().obs;
  List<ClubModel> clubs = List<ClubModel>.empty().obs;
  List<MemberModel> members = List<MemberModel>.empty().obs;

  void addForm(FormModel form) {
    forms.add(form);
  }

  void removeForm(int index) {
    forms.removeAt(index);
  }

  void addFormHobby(FormHobbyModel hobbyWidget, int index) {
    if (forms[index].listHobbyWidget.length < 5) {
      forms[index].listHobbyWidget.add(hobbyWidget);
    }
  }

  void removeFormhobby(int index, int indexHobby) {
    if (forms[index].listHobbyWidget.isNotEmpty) {
      forms[index].listHobbyWidget.removeAt(indexHobby);
    }
  }

  void addClubname(ClubModel clubModel) {
    clubs.add(clubModel);
  }

  void addMember(MemberModel memberModel) {
    members.add(memberModel);
  }

  void addMemberList(int index) {
    clubs[index].memberList.addAll(members);
  }

  void addHobby(String hobbyModel, int index) {
    members[index - 1].hobbyList.add(hobbyModel);
  }
}

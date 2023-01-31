class ClubModel {
  String clubname;
  List<MemberModel> memberList;
  ClubModel(this.clubname, this.memberList);
}

class MemberModel {
  String firstName;
  String lastName;
  List<HobbyModel> hobbyList;
  MemberModel(this.firstName, this.lastName, this.hobbyList);
}

class HobbyModel {
  String hobby;
  HobbyModel(this.hobby);
}

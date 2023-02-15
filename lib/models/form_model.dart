import 'package:flutter/material.dart';

class FormModel {
  Widget formWidget;
  List<FormHobbyModel> listHobbyWidget;
  FormModel(this.formWidget, this.listHobbyWidget);
}

class FormHobbyModel {
  Widget hobbyWidget;
  FormHobbyModel(this.hobbyWidget);
}

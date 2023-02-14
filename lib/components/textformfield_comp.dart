import 'package:club_assignment/controllers/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class TextFormFieldComp extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final Function? onSaved;
  final Widget? icon;

  TextFormFieldComp({
    super.key,
    required this.controller,
    this.onSaved,
    required this.title,
    this.icon,
  });

  final FormController formController = Get.find();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      onSaved: (newValue) {
        onSaved?.call();
      },
      decoration: InputDecoration(
        prefixIcon: icon,
        hintText: title,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required.';
        }
        if (formController.forms.isEmpty) {
          return 'This member is required.';
        }
        return null;
      },
    );
  }
}

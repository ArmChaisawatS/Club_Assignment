import 'package:club_assignment/components/button_comp.dart';
import 'package:club_assignment/components/textformfield_comp.dart';
import 'package:club_assignment/controllers/form_controller.dart';
import 'package:club_assignment/models/club_model.dart';
import 'package:club_assignment/models/form_model.dart';
import 'package:club_assignment/widgets/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormPage extends StatelessWidget {
  final int indexClub;
  FormPage({super.key, required this.indexClub});

  final FormController formController = Get.find();
  final _formkey = GlobalKey<FormState>();
  final clubnamecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Dynamic Fields",
          ),
        ),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormFieldComp(
                    controller: clubnamecontroller,
                    icon: const Icon(Icons.emoji_emotions),
                    title: "Clubname",
                    onSaved: () {
                      formController.addClubname(
                        ClubModel(
                          clubnamecontroller.text,
                          [],
                        ),
                      );
                    },
                  ),
                  Obx(
                    () => ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: formController.forms.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            const SizedBox(height: 10),
                            FormWidget(
                              index: index,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ButtonComp(
                    text: "ADD MEMBER",
                    onTap: () {
                      formController.addForm(
                        FormModel(
                          const FormWidget(),
                          [],
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ButtonComp(
                    text: "SUBMIT",
                    onTap: () {
                      if (_formkey.currentState!.validate()) {
                        _formkey.currentState?.save();
                        formController.addMemberList(indexClub);
                        formController.members.clear();
                        Get.back();
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

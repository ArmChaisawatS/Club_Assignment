import 'package:club_assignment/controllors/form_controllor.dart';
import 'package:club_assignment/models/club_model.dart';
import 'package:club_assignment/models/form_model.dart';
import 'package:club_assignment/widgets/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormPage extends StatelessWidget {
  FormPage({super.key});

  final FormControllor formControllor = Get.put(FormControllor());
  final _formkey = GlobalKey<FormState>();
  final clubnamecontrollor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Dynamic Fields"),
        ),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: clubnamecontrollor,
                    onSaved: (newValue) {
                      formControllor.addClubname(
                        ClubModel(
                            clubnamecontrollor.text, formControllor.members),
                      );
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.emoji_emotions),
                      hintText: "ClubName",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          formControllor.forms.isEmpty) {
                        return 'This field is required.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GetX<FormControllor>(
                    builder: (controller) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.forms.length,
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
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.purple,
                      ),
                      height: 40,
                      child: const Center(
                        child: Text(
                          "ADD MEMBER",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      formControllor.addForm(
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
                  InkWell(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.purple,
                      ),
                      height: 40,
                      child: const Center(
                        child: Text(
                          "SUBMIT",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      if (_formkey.currentState!.validate()) {
                        _formkey.currentState?.save();
                        formControllor.forms.clear();
                        clubnamecontrollor.clear();
                        formControllor.clubs.clear();
                        formControllor.members.clear();
                        formControllor.hobbys.clear();
                        Navigator.pop(context);
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

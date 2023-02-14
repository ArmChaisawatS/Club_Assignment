import 'package:club_assignment/components/button_comp.dart';
import 'package:club_assignment/components/textformfield_comp.dart';
import 'package:club_assignment/controllers/form_controller.dart';
import 'package:club_assignment/models/club_model.dart';
import 'package:club_assignment/models/form_model.dart';
import 'package:club_assignment/widgets/hobby_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormWidget extends StatefulWidget {
  final int? index;
  const FormWidget({super.key, this.index});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final FormController formController = Get.find();
  final firstnamecontroller = TextEditingController();
  final lastnamecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.amber,
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Member #${widget.index! + 1}",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                width: 230,
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {
                    formController.removeForm(widget.index ?? 0);
                  },
                  icon: const Icon(
                    Icons.delete,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormFieldComp(
            controller: firstnamecontroller,
            title: "Firstname",
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormFieldComp(
            controller: lastnamecontroller,
            title: "Lastname",
            onSaved: () {
              formController.addMember(
                MemberModel(
                  firstnamecontroller.text,
                  lastnamecontroller.text,
                  [],
                ),
              );
            },
          ),
          Obx(
            () => ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: formController
                  .forms[widget.index ?? 0].listHobbyWidget.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    HobbyWidget(
                      index: index,
                      onRemove: () {
                        setState(
                          () {
                            formController
                                .forms[widget.index ?? 0].listHobbyWidget
                                .removeAt(index);
                          },
                        );
                      },
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
            text: "ADD HOBBY",
            onTap: () {
              setState(
                () {
                  if (formController
                          .forms[widget.index ?? 0].listHobbyWidget.length <
                      5) {
                    formController.forms[widget.index ?? 0].listHobbyWidget.add(
                      FormHobbyModel(
                        const HobbyWidget(),
                      ),
                    );
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

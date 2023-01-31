import 'package:club_assignment/controllors/form_controllor.dart';
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
  final FormControllor formControllor = Get.find();
  final firstnamecontrollor = TextEditingController();
  final lastnamecontrollor = TextEditingController();

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
                    formControllor.removeForm(widget.index!);
                  },
                  icon: const Icon(Icons.delete),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: firstnamecontrollor,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              hintText: "Firstname",
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required.';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: lastnamecontrollor,
            onSaved: (newValue) {
              formControllor.addMember(
                MemberModel(
                  firstnamecontrollor.text,
                  lastnamecontrollor.text,
                  formControllor.hobbys,
                ),
              );
            },
            decoration: InputDecoration(
              hintText: "Lastname",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required.';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          GetBuilder<FormControllor>(
            builder: (controllor) => ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount:
                  formControllor.forms[widget.index!].listHobbyWidget.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const SizedBox(height: 10),
                    HobbyWidget(
                      index: index,
                      onRemove: () {
                        setState(
                          () {
                            controllor.forms[widget.index!].listHobbyWidget
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
                  "ADD HOBBY",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            onTap: () {
              setState(
                () {
                  formControllor.forms[widget.index!].listHobbyWidget.add(
                    FormHobbyModel(
                      const HobbyWidget(),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

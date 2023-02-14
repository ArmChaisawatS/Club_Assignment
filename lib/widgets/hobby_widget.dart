import 'package:club_assignment/components/textformfield_comp.dart';
import 'package:club_assignment/controllers/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class HobbyWidget extends StatefulWidget {
  final int? index;
  final Function? onRemove;
  const HobbyWidget({super.key, this.index, this.onRemove});

  @override
  State<HobbyWidget> createState() => _HobbyWidgetState();
}

class _HobbyWidgetState extends State<HobbyWidget> {
  final FormController formController = Get.find();
  final hobbycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.yellow,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormFieldComp(
              controller: hobbycontroller,
              title: "Hobby #${widget.index! + 1}",
              onSaved: () {
                formController.addHobby(
                  hobbycontroller.text,
                  formController.members.length,
                );
              },
            ),
          ),
          IconButton(
            onPressed: () {
              widget.onRemove?.call();
            },
            icon: const Icon(
              Icons.delete,
            ),
          ),
        ],
      ),
    );
  }
}

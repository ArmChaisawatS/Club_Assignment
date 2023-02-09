import 'package:club_assignment/controllers/form_controller.dart';
import 'package:club_assignment/models/club_model.dart';
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
            child: SizedBox(
              width: 320,
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: hobbycontroller,
                onSaved: (newValue) {
                  formController.addHobby(
                      HobbyModel(
                        hobbycontroller.text,
                      ),
                      formController.members.length);
                },
                decoration: InputDecoration(
                  hintText: "Hobby #${widget.index! + 1}",
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
            ),
          ),
          IconButton(
            onPressed: () {
              widget.onRemove?.call();
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}

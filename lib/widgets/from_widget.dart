import 'package:club_assignment/controllors/from_controllor.dart';
import 'package:club_assignment/models/from_model.dart';
import 'package:club_assignment/widgets/hobby_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FromWidget extends StatefulWidget {
  final int index;
  const FromWidget({super.key, required this.index});

  @override
  State<FromWidget> createState() => _FromWidgetState();
}

class _FromWidgetState extends State<FromWidget> {
  final FormControllor fromControllor = Get.find();

  @override
  Widget build(BuildContext context) {
    int indexHobby = 0;
    FormModel fromHobbyItem = fromControllor.froms[widget.index];
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
                "Member #${widget.index + 1}",
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
                    fromControllor.removeFrom(widget.index);
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
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              hintText: "Firstname",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              hintText: "Lastname",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GetBuilder<FormControllor>(
            builder: (controllor) => ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controllor.froms[widget.index].hobbyWidget.length,
              itemBuilder: (context, index) {
                indexHobby = index;
                return Column(
                  children: [
                    const SizedBox(height: 10),
                    HobbyWidget(
                      index: indexHobby,
                      onRemove: () {
                        setState(
                          () {
                            fromHobbyItem.hobbyWidget.removeAt(index);
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
                  fromHobbyItem.hobbyWidget.add(
                    HobbyWidget(
                      index: indexHobby,
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

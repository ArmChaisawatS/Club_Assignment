import 'package:club_assignment/controllors/from_controllor.dart';
import 'package:club_assignment/models/from_model.dart';
import 'package:club_assignment/widgets/from_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FromPage extends StatelessWidget {
  FromPage({super.key});

  final FormControllor fromControllor = Get.put(FormControllor());
  final _fromkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    int indexMember = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dynamic Fields"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _fromkey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.emoji_emotions),
                    hintText: "Club Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GetX<FormControllor>(
                  builder: (controller) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.froms.length,
                      itemBuilder: (context, index) {
                        indexMember = index;
                        return Column(
                          children: [
                            const SizedBox(height: 10),
                            FromWidget(
                              index: indexMember,
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
                    fromControllor.addForm(
                      FormModel(
                        FromWidget(
                          index: indexMember,
                        ),
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
                  onTap: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

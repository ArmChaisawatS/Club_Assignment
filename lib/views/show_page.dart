import 'package:club_assignment/controllors/form_controllor.dart';
import 'package:club_assignment/models/club_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowPage extends StatelessWidget {
  ShowPage({super.key});

  final FormControllor fromControllor = Get.put(FormControllor());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("from"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            fromControllor.clubs.isEmpty
                ? Container()
                : GetX<FormControllor>(
                    builder: (controller) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.clubs.length,
                        itemBuilder: (context, index) {
                          List<ClubModel> data = controller.clubs;
                          return ListTile(
                            title: Column(
                              children: [
                                Text(
                                  "Clubname : ${data[index].clubname}",
                                ),
                                GetX<FormControllor>(
                                  builder: (controller) {
                                    return ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: controller.members.length,
                                      itemBuilder: (context, index) {
                                        List<MemberModel> data =
                                            controller.members;
                                        return ListTile(
                                          title: Column(
                                            children: [
                                              Text(
                                                "Firstname : ${data[index].firstName}",
                                              ),
                                              Text(
                                                "Lastname : ${data[index].lastName}",
                                              ),
                                              GetX<FormControllor>(
                                                builder: (controller) {
                                                  return ListView.builder(
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    shrinkWrap: true,
                                                    itemCount: controller
                                                        .hobbys.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      List<HobbyModel> data =
                                                          controller.hobbys;
                                                      return ListTile(
                                                        title: Column(
                                                          children: [
                                                            Text(
                                                              "Hobby : ${data[index].hobby}",
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}

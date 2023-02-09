import 'package:club_assignment/models/club_model.dart';
import 'package:club_assignment/views/form_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/form_controller.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final FormController formController = Get.put(FormController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Form Dynamic"),
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              leading: const CircleAvatar(
                child: Text("1"),
              ),
              title: const Text("Form with dynamic fields"),
              subtitle: const Text("A Form with dynamic"),
              onTap: () {
                formController.forms.clear();
                Get.to(
                  FormPage(
                    indexClub: formController.clubs.length,
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => Expanded(
              child: formController.clubs.isEmpty
                  ? const Center(
                      child: Text("Please add form"),
                    )
                  : SingleChildScrollView(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: formController.clubs.length,
                        itemBuilder: (context, index) {
                          List<ClubModel> dataClub = formController.clubs;
                          return ListTile(
                            title: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.amber,
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    "Clubname : ${dataClub[index].clubname}",
                                  ),
                                  ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount:
                                        dataClub[index].memberList.length,
                                    itemBuilder: (context, indexMember) {
                                      List<MemberModel> dataMember =
                                          dataClub[index].memberList;
                                      return ListTile(
                                        title: Column(
                                          children: [
                                            Text(
                                              "Firstname : ${dataMember[indexMember].firstName}",
                                            ),
                                            Text(
                                              "Lastname : ${dataMember[indexMember].lastName}",
                                            ),
                                            dataMember[indexMember]
                                                    .hobbyList
                                                    .isEmpty
                                                ? const Center(
                                                    child: Text("hobby : -"),
                                                  )
                                                : ListView.builder(
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    shrinkWrap: true,
                                                    itemCount:
                                                        dataMember[indexMember]
                                                            .hobbyList
                                                            .length,
                                                    itemBuilder:
                                                        (context, indexHobby) {
                                                      List<HobbyModel>
                                                          dataHobby =
                                                          dataMember[
                                                                  indexMember]
                                                              .hobbyList;
                                                      return ListTile(
                                                        title: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            color:
                                                                Colors.purple,
                                                          ),
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                "hobby : ${dataHobby[indexHobby].hobby}",
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:club_assignment/views/form_page.dart';
import 'package:club_assignment/views/show_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<Widget> page = [
    FormPage(),
    ShowPage(),
  ];
  final List<String> title = [
    "Form with dynamic fields",
    "Show Form with dynamic fields"
  ];
  final List<String> subtitle = [
    "A Form with dynamic",
    "Show a Form with dynamic"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Form Dynamic"),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: page.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            leading: CircleAvatar(
              child: Text("${index + 1}"),
            ),
            title: Text(title[index]),
            subtitle: Text(subtitle[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => page[index],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HobbyWidget extends StatelessWidget {
  final int index;
  final Function? onRemove;

  const HobbyWidget({super.key, required this.index, this.onRemove});

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
                decoration: InputDecoration(
                  hintText: "Hobby #${index + 1}",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              onRemove?.call();
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}

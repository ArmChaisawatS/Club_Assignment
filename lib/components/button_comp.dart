import 'package:flutter/material.dart';

class ButtonComp extends StatelessWidget {
  final String text;
  final Function? onTap;
  const ButtonComp({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.purple,
        ),
        height: 40,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      onTap: () {
        onTap?.call();
      },
    );
  }
}

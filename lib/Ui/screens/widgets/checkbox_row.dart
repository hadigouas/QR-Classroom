import 'package:flutter/material.dart';
import 'package:steam_regestration_system/consts/mytext.dart';

class Mycheckbox extends StatefulWidget {
  const Mycheckbox({super.key});

  @override
  State<Mycheckbox> createState() => _MycheckboxState();
}

class _MycheckboxState extends State<Mycheckbox> {
  bool ischecked = true;
  bool ischecked2 = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Mytext(text: 'P'),
        Checkbox(
          value: ischecked,
          onChanged: (value) {
            setState(() {
              ischecked = value!;
              ischecked2 = !value;
            });
          },
        ),
        const Mytext(text: 'A'),
        Checkbox(
          value: ischecked2,
          onChanged: (value) {
            setState(() {
              ischecked = !value!;
              ischecked2 = value;
            });
          },
        ),
      ],
    );
  }
}

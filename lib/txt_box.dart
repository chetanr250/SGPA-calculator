import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextBox extends StatelessWidget {
  TextBox(
      {super.key,
      required this.ctrl,
      required this.onChange,
      required this.s,
      required this.c});
  // ignore: prefer_typing_uninitialized_variables
  final ctrl;
  final void Function(String) onChange;
  final int s;
  final int c;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        TextField(
          keyboardType: TextInputType.number,
          controller: ctrl,
          onChanged: onChange,
          decoration: InputDecoration(
            hintText: 'Subject $s marks',
            label: Text('$c credits subject $s'),
            contentPadding: const EdgeInsets.only(left: 20, right: 20),
          ),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          maxLength: 3,
        ),
      ],
    );
  }
}

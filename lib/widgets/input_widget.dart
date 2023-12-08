import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final Function() onTap;
  final Function(String) onChanged;
  final String labelText;
  final TextEditingController controller;
  const InputWidget(
      {Key? key,
      required this.onTap,
      required this.onChanged,
      required this.labelText,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: controller,
        onTap: () {
          onTap.call();
        },
        onChanged: (value) {
          onChanged.call(value);
        },
        keyboardType: TextInputType.text,
        cursorColor: Colors.blue,
        decoration: InputDecoration(
          labelStyle: const TextStyle(color: Colors.black),
          labelText: labelText,
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue)),
        ),
      ),
    );
  }
}

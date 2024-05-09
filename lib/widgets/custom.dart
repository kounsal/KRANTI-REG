import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final String? hint;
  final String? initialValue; // New parameter for pre-filled text
  final InputBorder? inputBorder;

  const CustomInput({
    Key? key,
    this.onChanged,
    this.hint,
    this.initialValue, // Initialize pre-filled text
    this.inputBorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextField(
        enabled:
            initialValue == null, // Disable the text field if it's pre-filled
        onChanged: onChanged != null ? (v) => onChanged!(v) : null,
        controller:
            TextEditingController(text: initialValue), // Set pre-filled text
        decoration: InputDecoration(hintText: hint ?? '', border: inputBorder),
      ),
    );
  }
}

class CustomBtn extends StatelessWidget {
  final Function? callback;
  final Widget? title;
  CustomBtn({Key? key, this.title, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        width: double.infinity,
        child: Container(
          color: Colors.blue,
          child: TextButton(
            onPressed: () => callback!(),
            child: title!,
          ),
        ),
      ),
    );
  }
}

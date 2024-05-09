import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:register/utils/validator.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final TextEditingController teamController;
  final String? Function(String?)? validator;
  bool? custom = false;
  final String text;
  CustomTextField(
      {super.key,
      required this.teamController,
      required this.text,
      this.validator,
      this.custom});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // autofocus: true,
      // validator: (value) => FormValidator.validateNotEmpty(value, text),
      controller: teamController,
      decoration: InputDecoration(
        labelText: text,
        labelStyle: const TextStyle(color: Colors.black, fontSize: 20),

        // hintText: text,
      ),
    );
  }
}

class CustomNumField extends StatelessWidget {
  final TextEditingController teamController;
  final String? Function(String?)? validator;
  bool? custom = false;
  final String text;
  CustomNumField(
      {super.key,
      required this.teamController,
      required this.text,
      this.validator,
      this.custom});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      autofocus: true,
      controller: teamController,
      decoration: InputDecoration(
        labelText: text,
        labelStyle: const TextStyle(color: Colors.black, fontSize: 20),

        // hintText: text,
      ),
    );
  }
}

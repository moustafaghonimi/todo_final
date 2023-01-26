
import 'package:flutter/material.dart';

class updateField extends StatelessWidget {

  TextEditingController controller;
  String hint;
  TextInputType type;
  Function(String) onChange;
  String? Function(String?) validator;
  updateField(this.controller,this.hint,this.type,this.onChange,this.validator);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(),
      keyboardType: type,
      decoration: InputDecoration(
        hintText: hint,
      ),
      onChanged: onChange,
      validator: validator,
    );
  }
}

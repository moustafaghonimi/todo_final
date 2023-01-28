
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        label: Text(hint,
          style: Theme.of(context)
              .textTheme
              .headline1
              ?.copyWith(fontWeight: FontWeight.w400,fontSize: 22),),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
                color:Colors.blue,
                style: BorderStyle.solid,
                width: 2)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
              color:Colors.blue,
              style: BorderStyle.solid,
              width: 2),

        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
              color:Colors.blue,
              style: BorderStyle.solid,
              width: 2),),
        hintText: hint

      ),      onChanged: onChange,
      validator: validator,
    );
  }
}

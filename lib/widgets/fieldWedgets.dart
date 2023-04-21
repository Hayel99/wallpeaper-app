// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class FieldWidget extends StatelessWidget {
  FieldWidget({
    required this.hintText,
    required this.onChanged,
  });
  String? hintText;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: TextFormField(
        validator: (data) {
          if (data!.isEmpty) {
            return "faild is requerd";
          }
        },
        style: TextStyle(color: Colors.white, fontSize: 18),
        onChanged: onChanged,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(20)),
          contentPadding: EdgeInsets.all(20),
          hintText: "$hintText",
          hintStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}

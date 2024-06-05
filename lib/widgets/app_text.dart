import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  AppText({super.key, required this.labelText, required this.hintText, this.password = false,
  required this.controller, required this.validator, required this.keyboardType, this.textInputAction = null, 
  this.focusNode = null});

    String labelText;
    String hintText;
    bool password = false;
    TextEditingController controller;
    FormFieldValidator<String>? validator;
    TextInputType? keyboardType;
    TextInputAction? textInputAction;
    FocusNode? focusNode;
    final _focusSenha = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: password,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (String text) {
      FocusScope.of(context).requestFocus(_focusSenha);
      },
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        // border: UnderlineInputBorder(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
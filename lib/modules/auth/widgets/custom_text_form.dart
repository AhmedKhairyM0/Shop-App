import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    Key? key,
    required this.hint,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.isNotVisable = false,
  }) : super(key: key);

  final String hint;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool isNotVisable;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        onSaved: onSaved,
        validator: validator,
        onChanged: onChanged,
        keyboardType: keyboardType,
        obscureText: isNotVisable,
        decoration: InputDecoration(
          hintText: hint,
        ),
      ),
    );
  }
}

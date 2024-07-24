import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController inputController;
  final String labelText;
  final int maxLines;
  Iterable<String>? autoFillHints;
  CustomTextFormField({
    super.key,
    required this.inputController,
    required this.labelText,
    this.maxLines = 1,
    this.autoFillHints,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $labelText';
        }
        return null;
      },
      controller: inputController,
      maxLines: maxLines,
      autofillHints: autoFillHints ?? [],
      decoration: InputDecoration(
        hoverColor: Colors.transparent,
        label: Text(labelText),
        alignLabelWithHint: maxLines > 1 ? true : false,
        floatingLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        filled: true,
        fillColor: Colors.teal[50],
        contentPadding: const EdgeInsets.all(20.0),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal[800]!,
            width: 2.0,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }
}

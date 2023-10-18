import 'package:flutter/material.dart';

class TextFildWidget extends StatefulWidget {
  final String string;
  final TextEditingController controller;
  final TextInputType inputType;
  const TextFildWidget(
      {super.key,
      required this.string,
      required this.controller,
      required this.inputType});

  @override
  State<TextFildWidget> createState() => _TextFildWidgetState();
}

class _TextFildWidgetState extends State<TextFildWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        keyboardType: widget.inputType,
        controller: widget.controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors
                    .blue), // Cor da borda quando o campo não está em foco
          ),
          labelText: widget.string,
        ),
      ),
    );
  }
}

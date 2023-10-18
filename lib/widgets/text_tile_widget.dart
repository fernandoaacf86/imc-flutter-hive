import 'package:flutter/material.dart';

class TextTileWidget extends StatelessWidget {
  final String text;
  const TextTileWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
      ),
    );
  }
}

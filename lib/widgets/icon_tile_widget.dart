import 'package:flutter/material.dart';

class IconTileWidget extends StatelessWidget {
  final IconData icon;
  final double size;
  const IconTileWidget({super.key, required this.icon, required this.size});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: Colors.white,
      size: size,
    );
  }
}

import 'package:flutter/material.dart';

class AppNavigationBar extends StatelessWidget {
  final String title;

  const AppNavigationBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      elevation: 0,
    );
  }
}

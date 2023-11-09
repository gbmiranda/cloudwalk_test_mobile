import 'package:flutter/material.dart';

class AppLoading extends StatelessWidget {
  final bool isCenter;

  const AppLoading({super.key, this.isCenter = false});

  @override
  Widget build(BuildContext context) {
    if (isCenter) {
      return Center(
        child: _progress(context),
      );
    }
    return _progress(context);
  }

  Widget _progress(BuildContext context) {
    return SizedBox(
      width: 25.0,
      height: 25.0,
      child: CircularProgressIndicator(
        valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
        backgroundColor: Colors.white.withOpacity(0.3),
        strokeWidth: 2.0,
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'app_text.dart';

class AppNavigationBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  const AppNavigationBar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null ? AppText(text: title!, style: AppTextStyle.titleLarge) : const SizedBox.shrink(),
      centerTitle: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 30.0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

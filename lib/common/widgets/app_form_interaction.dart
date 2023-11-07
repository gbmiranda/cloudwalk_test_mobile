import 'package:flutter/material.dart';

import '../utils/keyboard_utils.dart';

class AppFormInteraction extends StatelessWidget {
  static const _enabledOpacity = 1.0;

  final bool enabled;
  final bool hideKeyboardWhenInteracting;
  final double disabledOpacity;
  final Widget child;

  const AppFormInteraction({
    super.key,
    required this.child,
    this.enabled = true,
    this.hideKeyboardWhenInteracting = true,
    this.disabledOpacity = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      child: GestureDetector(
        onTap: () => _closeKeyboard(),
        child: IgnorePointer(
          ignoring: !enabled,
          child: Opacity(
            opacity: enabled ? _enabledOpacity : disabledOpacity,
            child: child,
          ),
        ),
      ),
      onNotification: (notification) {
        if (notification is ScrollStartNotification) {
          _closeKeyboard();
        }
        return true;
      },
    );
  }

  void _closeKeyboard() {
    if (!hideKeyboardWhenInteracting) return;
    KeyboardUtils.hideKeyboard();
  }
}

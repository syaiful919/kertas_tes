import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

class DSSnackBar {
  DSSnackBar._();

  static void show({
    required BuildContext context,
    required DSHighlightInfoType type,
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + Gap.md,
        left: Gap.md,
        right: Gap.md,
        child: Material(
          color: Colors.transparent,
          child: DSHighlightInfo(
            type: type,
            message: message,
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(duration, () {
      overlayEntry.remove();
    });
  }
}

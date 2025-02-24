import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

class DSActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Widget? icon;

  const DSActionButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Center(
        child: SpacedRow(
          space: Gap.xxs,
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            Text(
              title,
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: FontSize.md,
                height: 1.25,
              ),
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }
}

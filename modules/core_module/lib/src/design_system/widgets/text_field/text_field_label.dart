import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

class TextFieldLabel extends StatelessWidget {
  final String label;
  final bool isRequired;

  const TextFieldLabel({
    super.key,
    required this.label,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    String requiredBadge = "";
    if (isRequired) {
      requiredBadge = " *";
    }

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: label,
            style: const TextStyle(
              fontSize: FontSize.sm,
              color: AppColors.blue700,
              height: 1.25,
              fontWeight: FontWeight.w600,
            ),
            children: [
              TextSpan(
                text: requiredBadge,
                style: const TextStyle(
                  color: AppColors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

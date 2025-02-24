import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

class DSListTile extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const DSListTile({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: Gap.sm),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.grey100,
            ),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: AppColors.blue700,
            fontSize: FontSize.md,
            height: 1.25,
          ),
        ),
      ),
    );
  }
}

import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

class DSFlatCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  const DSFlatCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(
      vertical: Gap.md,
      horizontal: Gap.sm,
    ),
    this.margin = const EdgeInsets.all(Gap.none),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: Corners.smRadius,
        border: Border.all(color: AppColors.grey100),
      ),
      child: child,
    );
  }
}

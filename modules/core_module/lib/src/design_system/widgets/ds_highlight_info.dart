import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

enum DSHighlightInfoType { success, error, info }

class DSHighlightInfo extends StatelessWidget {
  final DSHighlightInfoType type;
  final String message;

  const DSHighlightInfo({
    super.key,
    required this.type,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: Gap.xs,
        horizontal: Gap.md,
      ),
      decoration: BoxDecoration(
        color: _getBackgroundColor(type),
        border: Border.all(color: _getForegroundColor(type)),
        borderRadius: Corners.smRadius,
      ),
      child: SpacedRow(
        space: Gap.sm,
        children: [
          Icon(
            _getIcon(type),
            color: _getForegroundColor(type),
            size: FontSize.xl,
          ),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: AppColors.black,
                fontSize: FontSize.sm,
                height: 1.25,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Color _getBackgroundColor(DSHighlightInfoType type) {
    switch (type) {
      case DSHighlightInfoType.error:
        return AppColors.red50;
      case DSHighlightInfoType.info:
        return AppColors.yellow50;
      case DSHighlightInfoType.success:
        return AppColors.green50;
    }
  }

  static Color _getForegroundColor(DSHighlightInfoType type) {
    switch (type) {
      case DSHighlightInfoType.error:
        return AppColors.red;
      case DSHighlightInfoType.info:
        return AppColors.yellow;
      case DSHighlightInfoType.success:
        return AppColors.green;
    }
  }

  static IconData _getIcon(DSHighlightInfoType type) {
    switch (type) {
      case DSHighlightInfoType.error:
        return Icons.remove_circle;
      case DSHighlightInfoType.info:
        return Icons.info;
      case DSHighlightInfoType.success:
        return Icons.check_circle;
    }
  }
}

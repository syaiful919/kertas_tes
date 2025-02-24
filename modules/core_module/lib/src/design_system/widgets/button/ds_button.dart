import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

enum DSButtonType { filled, outlined }

enum DSButtonSizeType { small, medium }

class DSButton extends StatelessWidget {
  final DSButtonType type;
  final DSButtonSizeType size;
  final String title;
  final bool isEnabled;
  final Color? color;
  final Widget? icon;
  final VoidCallback? onPressed;

  const DSButton({
    super.key,
    required this.title,
    this.type = DSButtonType.filled,
    this.size = DSButtonSizeType.medium,
    this.color = AppColors.primary,
    this.isEnabled = true,
    this.onPressed,
    this.icon,
  });

  final double disabledOpacity = 0.5;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (!isEnabled) {
          return;
        }
        onPressed?.call();
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: _getBackgroundColor(),
        padding: _getPadding(),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: Corners.xxxlRadius,
          side: BorderSide(color: _getBorderColor()),
        ),
        minimumSize: const Size(0, 0),
      ),
      child: SpacedRow(
        mainAxisAlignment: MainAxisAlignment.center,
        space: 8,
        children: [
          icon,
          Text(
            title,
            style: TextStyle(
              fontSize: _getFontSize(),
              color: _getForegroundColor(),
              height: 1.25,
            ),
          ),
        ],
      ),
    );
  }

  Color _getBackgroundColor() {
    switch (type) {
      case DSButtonType.filled:
        return (color ?? AppColors.primary)
            .withOpacity(isEnabled ? 1 : disabledOpacity);
      case DSButtonType.outlined:
        if (!isEnabled) {
          return AppColors.grey100;
        }
        return AppColors.white;
    }
  }

  Color _getForegroundColor() {
    switch (type) {
      case DSButtonType.filled:
        return AppColors.white;
      case DSButtonType.outlined:
        return (color ?? AppColors.primary)
            .withOpacity(isEnabled ? 1 : disabledOpacity);
    }
  }

  Color _getBorderColor() {
    return (color ?? AppColors.primary)
        .withOpacity(isEnabled ? 1 : disabledOpacity);
  }

  EdgeInsetsGeometry _getPadding() {
    switch (size) {
      case DSButtonSizeType.medium:
        return const EdgeInsets.symmetric(
          horizontal: Gap.sm,
          vertical: Gap.xs,
        );
      case DSButtonSizeType.small:
        return const EdgeInsets.symmetric(
          horizontal: Gap.sm,
          vertical: Gap.xxs,
        );
    }
  }

  double _getFontSize() {
    switch (size) {
      case DSButtonSizeType.medium:
        return FontSize.lg;
      case DSButtonSizeType.small:
        return FontSize.sm;
    }
  }
}

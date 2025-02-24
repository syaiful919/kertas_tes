import 'package:core_module/core_module.dart';
import 'package:core_module/src/locale/strings.g.dart';
import 'package:flutter/material.dart';

class DefaultErrorView extends StatelessWidget {
  final String message;
  final VoidCallback? onTapRetry;
  final String? retryTitle;

  const DefaultErrorView({
    super.key,
    required this.message,
    this.onTapRetry,
    this.retryTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpacedColumn(
        mainAxisSize: MainAxisSize.min,
        space: Gap.xs,
        children: [
          Text(
            message,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: FontSize.sm,
              height: 1.25,
            ),
          ),
          _getRetryButton(),
        ],
      ),
    );
  }

  Widget? _getRetryButton() {
    if (onTapRetry == null) {
      return null;
    }

    return SizedBox(
      width: 200,
      child: DSButton(
        title: retryTitle ?? locale.general.buttons.retry,
        size: DSButtonSizeType.small,
        onPressed: onTapRetry,
      ),
    );
  }
}

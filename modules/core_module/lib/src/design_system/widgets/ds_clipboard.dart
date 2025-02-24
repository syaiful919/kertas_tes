import 'package:core_module/core_module.dart';
import 'package:core_module/src/locale/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DSClipboard extends StatelessWidget {
  final String value;

  const DSClipboard({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Clipboard.setData(ClipboardData(text: value));
        DSSnackBar.show(
          context: context,
          type: DSHighlightInfoType.success,
          message: locale.general.labels.successCopyText,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white100,
          borderRadius: Corners.smRadius,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: Gap.md,
          vertical: Gap.xs,
        ),
        child: SpacedRow(
          space: Gap.xxs,
          children: [
            Expanded(
              child: Text(
                value,
                style: const TextStyle(
                  color: AppColors.black,
                  fontSize: FontSize.xl,
                  fontWeight: FontWeight.w600,
                  height: 1.25,
                ),
              ),
            ),
            Text(
              locale.general.buttons.copyText,
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: FontSize.lg,
                height: 1.25,
              ),
            )
          ],
        ),
      ),
    );
  }
}

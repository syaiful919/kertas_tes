import 'package:core_module/src/design_system/constants/app_colors.dart';
import 'package:core_module/src/design_system/constants/font_size.dart';
import 'package:flutter/material.dart';

class PlainAppbar extends AppBar {
  PlainAppbar({
    super.key,
    required BuildContext context,
    required String title,
    VoidCallback? onTapBack,
  }) : super(
          backgroundColor: AppColors.primary,
          leading: IconButton(
            onPressed: () {
              if (onTapBack == null) {
                Navigator.of(context).pop();
                return;
              }

              onTapBack.call();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.white,
              size: FontSize.xl,
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: FontSize.xl,
            ),
          ),
          centerTitle: true,
        );
}

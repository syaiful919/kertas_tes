import 'package:core_module/src/design_system/constants/constants.dart';
import 'package:core_module/src/locale/strings.g.dart';
import 'package:flutter/material.dart';

class DefaultEmptyView extends StatelessWidget {
  const DefaultEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        locale.general.labels.emptyData,
        style: const TextStyle(
          color: AppColors.primary,
          fontSize: FontSize.sm,
          height: 1.25,
        ),
      ),
    );
  }
}

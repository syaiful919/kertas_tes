import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

class DSRadio<T> extends StatelessWidget {
  final T value;
  final T? selectedValue;
  final void Function(T?)? onChanged;

  const DSRadio({
    super.key,
    required this.value,
    this.selectedValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Radio(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      fillColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary;
        }
        return AppColors.grey600;
      }),
      value: value,
      groupValue: selectedValue,
      onChanged: onChanged,
    );
  }
}

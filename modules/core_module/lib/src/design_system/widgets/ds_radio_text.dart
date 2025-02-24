import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

class DSRadioText<T> extends StatelessWidget {
  final T value;
  final T? selectedValue;
  final String label;
  final void Function(T?)? onChanged;

  const DSRadioText({
    super.key,
    required this.value,
    required this.label,
    this.selectedValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SpacedRow(
      mainAxisSize: MainAxisSize.min,
      children: [
        DSRadio(
          value: value,
          selectedValue: selectedValue,
          onChanged: onChanged,
        ),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.black,
            fontSize: FontSize.xs,
            height: 1.25,
          ),
        ),
      ],
    );
  }
}

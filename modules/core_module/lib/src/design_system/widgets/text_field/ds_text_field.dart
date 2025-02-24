import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

import 'text_field_label.dart';

class DSTextField extends StatelessWidget {
  final String placeholder;
  final String label;
  final bool isRequired;
  final String? initialValue;
  final TextInputType? keyboardType;

  final void Function(String)? onChanged;

  const DSTextField({
    super.key,
    required this.label,
    this.isRequired = false,
    this.placeholder = '',
    this.keyboardType,
    this.onChanged,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return SpacedColumn(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFieldLabel(
          label: label,
          isRequired: isRequired,
        ),
        Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: AppColors.grey400),
            ),
          ),
          child: TextFormField(
            initialValue: initialValue,
            onChanged: onChanged,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: FontSize.sm,
            ),
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: const TextStyle(
                color: AppColors.grey300,
                fontSize: FontSize.sm,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(Gap.none),
            ),
          ),
        ),
      ],
    );
  }
}

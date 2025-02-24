import 'package:core_module/core_module.dart';
import 'package:core_module/src/design_system/widgets/text_field/text_field_label.dart';
import 'package:flutter/material.dart';

class TextFieldDropDown extends StatelessWidget {
  final String label;
  final String placeholder;
  final VoidCallback onTap;
  final bool isRequired;
  final String? value;

  const TextFieldDropDown({
    super.key,
    required this.label,
    required this.placeholder,
    required this.onTap,
    this.isRequired = false,
    this.value,
  });

  bool get isFilled => value != null;

  @override
  Widget build(BuildContext context) {
    return SpacedColumn(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFieldLabel(
          label: label,
          isRequired: isRequired,
        ),
        _buildDropDown(),
      ],
    );
  }

  Widget _buildDropDown() {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: Gap.xs),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.grey400),
          ),
        ),
        child: SpacedRow(
          space: 8,
          children: [
            Expanded(
              child: Text(
                value ?? placeholder,
                style: TextStyle(
                  fontSize: FontSize.sm,
                  color: isFilled ? AppColors.black : AppColors.grey300,
                  height: 1.25,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_drop_down,
              color: AppColors.blue700,
              size: FontSize.xxl,
            )
          ],
        ),
      ),
    );
  }
}

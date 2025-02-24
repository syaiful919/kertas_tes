import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final void Function(String)? onChanged;
  final String placeholder;
  final bool useShadow;

  const SearchField({
    super.key,
    this.onChanged,
    required this.placeholder,
    this.useShadow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _getDecoration(),
      child: TextFormField(
        onChanged: onChanged,
        style: const TextStyle(
          color: AppColors.blue700,
          fontSize: FontSize.md,
        ),
        decoration: InputDecoration(
          fillColor: AppColors.white,
          focusColor: AppColors.white,
          filled: true,
          hintText: placeholder,
          hintStyle: const TextStyle(
            color: AppColors.grey300,
            fontSize: FontSize.md,
          ),
          contentPadding: const EdgeInsets.fromLTRB(
            Gap.xxs,
            Gap.xxs,
            Gap.xxs,
            Gap.xxs,
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.grey100,
            ),
            borderRadius: Corners.xxxlRadius,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.grey100,
            ),
            borderRadius: Corners.xxxlRadius,
          ),
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: Gap.xs),
            child: Icon(
              Icons.search,
              color: AppColors.grey600,
              size: FontSize.xl,
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration? _getDecoration() {
    if (!useShadow) {
      return null;
    }

    return BoxDecoration(
      borderRadius: Corners.xxxlRadius,
      boxShadow: [
        BoxShadow(
          color: AppColors.black.withOpacity(0.075),
          spreadRadius: Corners.xs,
          blurRadius: Corners.sm,
        ),
      ],
    );
  }
}

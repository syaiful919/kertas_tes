import 'package:core_module/core_module.dart';
import 'package:domain_module/domain_module.dart';
import 'package:flutter/material.dart';

import 'payment_method_radio_tile.dart';

class PaymentMethodGroupCard extends StatelessWidget {
  final PaymentMethodGroupEntity group;
  final String? selectedMethodId;
  final void Function(PaymentMethodEntity) onSelect;

  const PaymentMethodGroupCard({
    super.key,
    required this.group,
    required this.onSelect,
    this.selectedMethodId,
  });

  @override
  Widget build(BuildContext context) {
    return DSFlatCard(
      child: SpacedColumn(
        space: Gap.sm,
        children: [
          _getHeader(),
          ...group.methods.map(
            (e) => PaymentMethodRadioTile(
              selectedMethodId: selectedMethodId,
              item: e,
              onSelect: onSelect,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getHeader() {
    Widget? estimation;
    if (group.disbursementEstimation.isNotEmpty) {
      estimation = Text(
        group.name,
        style: const TextStyle(
          color: AppColors.primary,
          fontSize: FontSize.xs,
          height: 1.25,
        ),
      );
    }
    return SpacedRow(
      space: Gap.xxs,
      children: [
        Image.network(
          group.iconUrl,
          width: 50,
        ),
        Expanded(
          child: SpacedColumn(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            space: Gap.xxxs,
            children: [
              Text(
                group.name,
                style: const TextStyle(
                  color: AppColors.black,
                  fontSize: FontSize.md,
                  fontWeight: FontWeight.w600,
                  height: 1.25,
                ),
              ),
              estimation,
            ],
          ),
        ),
      ],
    );
  }
}

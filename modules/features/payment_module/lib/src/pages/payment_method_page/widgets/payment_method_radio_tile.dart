import 'package:core_module/core_module.dart';
import 'package:domain_module/domain_module.dart';
import 'package:flutter/material.dart';

class PaymentMethodRadioTile extends StatelessWidget {
  final PaymentMethodEntity item;
  final String? selectedMethodId;
  final void Function(PaymentMethodEntity) onSelect;

  const PaymentMethodRadioTile({
    super.key,
    required this.item,
    this.selectedMethodId,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    Widget? estimation;
    if (item.disbursementEstimation.isNotEmpty) {
      estimation = Text(
        item.name,
        style: const TextStyle(
          color: AppColors.primary,
          fontSize: FontSize.xs,
          height: 1.25,
        ),
      );
    }
    return SpacedRow(
      space: Gap.xs,
      children: [
        Image.network(
          item.iconUrl,
          width: 50,
        ),
        Expanded(
          child: SpacedColumn(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            space: Gap.xxxs,
            children: [
              Text(
                item.name,
                style: const TextStyle(
                  color: AppColors.black,
                  fontSize: FontSize.sm,
                  height: 1.25,
                ),
              ),
              Text(
                item.priceFormatted,
                style: const TextStyle(
                  color: AppColors.grey,
                  fontSize: FontSize.xs,
                  height: 1.25,
                ),
              ),
              estimation,
            ],
          ),
        ),
        DSRadio(
          selectedValue: selectedMethodId,
          value: item.id,
          onChanged: (_) {
            onSelect.call(item);
          },
        ),
      ],
    );
  }
}

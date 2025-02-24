import 'package:core_module/core_module.dart';
import 'package:domain_module/domain_module.dart';
import 'package:flutter/material.dart';

class InformationSummaryCard extends StatelessWidget {
  final List<PaymentInfoEntity> informations;

  const InformationSummaryCard({
    super.key,
    required this.informations,
  });

  @override
  Widget build(BuildContext context) {
    return DSFlatCard(
      child: SpacedColumn(
        children: informations
            .mapIndexed(
              (i, e) => _getItem(item: e, isLast: i == informations.length - 1),
            )
            .toList(),
      ),
    );
  }

  Widget _getItem({
    required PaymentInfoEntity item,
    bool isLast = false,
  }) {
    Border? border;
    FontWeight valueWeight = FontWeight.w400;
    if (isLast) {
      border = const Border(top: BorderSide(color: AppColors.grey400));
      valueWeight = FontWeight.w600;
    }
    return Container(
      decoration: BoxDecoration(border: border),
      padding: const EdgeInsets.symmetric(vertical: Gap.xs),
      child: SpacedRow(
        crossAxisAlignment: CrossAxisAlignment.start,
        space: Gap.xxs,
        children: [
          Expanded(
            child: Text(
              item.description,
              style: const TextStyle(
                color: AppColors.grey,
                fontSize: FontSize.md,
                height: 1.25,
              ),
            ),
          ),
          Expanded(
            child: Text(
              item.value,
              style: TextStyle(
                color: AppColors.blue700,
                fontSize: FontSize.md,
                height: 1.25,
                fontWeight: valueWeight,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}

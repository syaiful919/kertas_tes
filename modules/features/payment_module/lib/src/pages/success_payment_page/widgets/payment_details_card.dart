import 'package:core_module/core_module.dart';
import 'package:domain_module/domain_module.dart';
import 'package:flutter/material.dart';
import 'package:payment_module/src/locale/strings.g.dart';

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: Gap.xxxs),
            child: Text(
              locale.successPaymentPage.labels.paymentDetail,
              style: const TextStyle(
                color: AppColors.black,
                fontSize: FontSize.md,
                fontWeight: FontWeight.w600,
                height: 1.25,
              ),
            ),
          ),
          ...informations.mapIndexed(
            (i, e) => _getItem(item: e, isLast: i == informations.length - 1),
          )
        ],
      ),
    );
  }

  Widget _getItem({
    required PaymentInfoEntity item,
    bool isLast = false,
  }) {
    FontWeight valueWeight = FontWeight.w400;
    if (isLast) {
      valueWeight = FontWeight.w600;
    }
    return Container(
      padding: const EdgeInsets.symmetric(vertical: Gap.xxs),
      child: SpacedRow(
        space: Gap.xxs,
        crossAxisAlignment: CrossAxisAlignment.start,
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

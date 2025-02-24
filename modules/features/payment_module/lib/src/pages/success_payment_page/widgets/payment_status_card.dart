import 'package:core_module/core_module.dart';
import 'package:domain_module/domain_module.dart';
import 'package:flutter/material.dart';
import 'package:payment_module/src/locale/strings.g.dart';

class PaymentStatusCard extends StatelessWidget {
  final PaymentReceiptEntity receipt;
  final VoidCallback onTapDetail;

  const PaymentStatusCard({
    super.key,
    required this.receipt,
    required this.onTapDetail,
  });

  @override
  Widget build(BuildContext context) {
    return DSFlatCard(
      child: SpacedColumn(
        space: Gap.sm,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              locale.successPaymentPage.labels.paymentSuccess,
              style: const TextStyle(
                color: AppColors.black,
                fontSize: FontSize.lg,
                fontWeight: FontWeight.w600,
                height: 1.25,
              ),
            ),
          ),
          SpacedRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _getChip(),
              GestureDetector(
                onTap: onTapDetail,
                child: Text(
                  locale.successPaymentPage.buttons.seeStatus,
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: FontSize.md,
                    fontWeight: FontWeight.w600,
                    height: 1.25,
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            height: 1,
            color: AppColors.grey100,
            thickness: 1,
          ),
          Text(
            locale.successPaymentPage.labels.paymentMethod,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: FontSize.md,
              fontWeight: FontWeight.w600,
              height: 1.25,
            ),
          ),
          SpacedRow(
            space: Gap.xxs,
            children: [
              Image.network(
                receipt.iconUrl,
                width: 50,
              ),
              Expanded(
                child: Text(
                  receipt.paymentMethodName,
                  style: const TextStyle(
                    color: AppColors.black,
                    fontSize: FontSize.md,
                    height: 1.25,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _getChip() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.green,
        borderRadius: Corners.lgRadius,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Gap.xs,
        vertical: Gap.xxs,
      ),
      child: Text(
        locale.successPaymentPage.labels.paymentCompleted,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: FontSize.xs,
          fontWeight: FontWeight.w500,
          height: 1.25,
        ),
      ),
    );
  }
}

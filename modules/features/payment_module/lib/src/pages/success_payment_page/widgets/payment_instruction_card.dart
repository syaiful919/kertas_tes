import 'package:core_module/core_module.dart';
import 'package:domain_module/domain_module.dart';
import 'package:flutter/material.dart';
import 'package:payment_module/src/locale/strings.g.dart';

class PaymentInstructionCard extends StatelessWidget {
  final PaymentInstructionEntity instruction;

  const PaymentInstructionCard({
    super.key,
    required this.instruction,
  });

  @override
  Widget build(BuildContext context) {
    return DSFlatCard(
      child: SpacedColumn(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildAccount(),
          const Divider(
            color: AppColors.grey400,
            height: Gap.xxl,
          ),
          _buildAmount(),
        ],
      ),
    );
  }

  Widget _buildAccount() {
    return SpacedColumn(
      space: Gap.xs,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          locale.pendingPaymentPage.labels.transferTo,
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
              instruction.iconUrl,
              width: 50,
            ),
            Expanded(
              child: SpacedColumn(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                space: Gap.xxxs,
                children: [
                  Text(
                    instruction.paymentMethodName,
                    style: const TextStyle(
                      color: AppColors.black,
                      fontSize: FontSize.md,
                      fontWeight: FontWeight.w600,
                      height: 1.25,
                    ),
                  ),
                  Text(
                    instruction.bankAccountName,
                    style: const TextStyle(
                      color: AppColors.grey,
                      fontSize: FontSize.xs,
                      height: 1.25,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        DSClipboard(
          value: instruction.bankAccountNumber,
        ),
      ],
    );
  }

  Widget _buildAmount() {
    return SpacedColumn(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      space: Gap.xs,
      children: [
        Text(
          locale.pendingPaymentPage.labels.totalPayment,
          style: const TextStyle(
            color: AppColors.black,
            fontSize: FontSize.md,
            fontWeight: FontWeight.w600,
            height: 1.25,
          ),
        ),
        DSClipboard(
          value: instruction.totalAmount.currency(),
        ),
      ],
    );
  }
}

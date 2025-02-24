import 'package:core_module/core_module.dart';
import 'package:domain_module/domain_module.dart';
import 'package:flutter/material.dart';
import 'package:payment_module/src/locale/strings.g.dart';

class PartnerAccountCard extends StatelessWidget {
  final BankAccountEntity? account;
  final VoidCallback onTapAdd;
  final Function(BankAccountEntity) onTapEdit;

  const PartnerAccountCard({
    super.key,
    this.account,
    required this.onTapAdd,
    required this.onTapEdit,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = _buildEmptyState();

    final BankAccountEntity? data = account;
    if (data != null) {
      content = _buildAccountCard(data);
    }

    return DSExpansionPanel(
      title: locale.paymentDetailPage.labels.receiverBankInfo,
      child: content,
    );
  }

  Widget _buildAccountCard(BankAccountEntity data) {
    return GestureDetector(
      onTap: () => onTapEdit(data),
      child: DSFlatCard(
        padding: const EdgeInsets.symmetric(
          vertical: Gap.md,
          horizontal: Gap.xxs,
        ),
        child: SpacedColumn(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          space: Gap.xxxs,
          children: [
            Text(
              data.bank.name,
              style: const TextStyle(
                color: AppColors.black,
                fontSize: FontSize.lg,
                fontWeight: FontWeight.w500,
                height: 1.25,
              ),
            ),
            Text(
              data.accountNumber,
              style: const TextStyle(
                color: AppColors.black,
                fontSize: FontSize.lg,
                height: 1.25,
              ),
            ),
            _buildAccountName(data.accountName),
          ],
        ),
      ),
    );
  }

  Widget? _buildAccountName(String name) {
    if (name.isEmpty) {
      return null;
    }

    return Text(
      locale.paymentDetailPage.labels.accountName(value: name),
      style: const TextStyle(
        color: AppColors.grey600,
        fontSize: FontSize.lg,
        height: 1.25,
      ),
    );
  }

  Widget _buildEmptyState() {
    return SpacedColumn(
      space: Gap.md,
      children: [
        DSHighlightInfo(
          type: DSHighlightInfoType.info,
          message: locale.paymentDetailPage.labels.addBankAccountInfo,
        ),
        DSButton(
          type: DSButtonType.outlined,
          title: locale.paymentDetailPage.buttons.addBankAccount,
          icon: const Icon(
            Icons.add_circle_outline,
            color: AppColors.primary,
            size: FontSize.xl,
          ),
          onPressed: onTapAdd,
        ),
      ],
    );
  }
}

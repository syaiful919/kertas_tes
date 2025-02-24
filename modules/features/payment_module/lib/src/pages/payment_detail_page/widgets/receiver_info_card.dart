import 'package:core_module/core_module.dart';
import 'package:domain_module/domain_module.dart';
import 'package:flutter/material.dart';
import 'package:payment_module/src/locale/strings.g.dart';

class ReceiverInfoCard extends StatelessWidget {
  final PartnerEntity partner;
  final NotificationType notificationType;

  final void Function(NotificationType) onChangeNotificationType;
  final void Function(double) onChangeAmout;
  final void Function(String) onChangeNotes;

  const ReceiverInfoCard({
    super.key,
    required this.partner,
    required this.notificationType,
    required this.onChangeNotificationType,
    required this.onChangeAmout,
    required this.onChangeNotes,
  });

  @override
  Widget build(BuildContext context) {
    return DSExpansionPanel(
      title: locale.paymentDetailPage.labels.receiverInfo,
      child: DSFlatCard(
        padding: const EdgeInsets.symmetric(vertical: Gap.md),
        child: SpacedColumn(
          space: Gap.md,
          children: [
            _buildPartner(),
            _buildNotificationMethodSelection(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Gap.sm),
              child: DSTextField(
                label: locale.paymentDetailPage.labels.paymentAmount,
                placeholder: locale.paymentDetailPage.placeholders.sampleAmount,
                keyboardType: TextInputType.number,
                onChanged: (val) {
                  onChangeAmout.call(double.tryParse(val) ?? 0);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Gap.sm),
              child: DSTextField(
                label: locale.paymentDetailPage.labels.notes,
                placeholder: locale.paymentDetailPage.placeholders.sampleNotes,
                onChanged: (val) {
                  onChangeNotes.call(val);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPartner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Gap.sm),
      child: SpacedRow(
        space: Gap.xxs,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.primary,
            radius: Corners.xl,
            child: Text(
              partner.name.getAbbreviation(),
              style: const TextStyle(
                color: AppColors.white,
                fontSize: FontSize.md,
              ),
            ),
          ),
          Expanded(
            child: SpacedColumn(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              space: Gap.xxxxs,
              children: [
                Text(
                  partner.name,
                  style: const TextStyle(
                    color: AppColors.blue700,
                    fontSize: FontSize.lg,
                    fontWeight: FontWeight.w500,
                    height: 1.25,
                  ),
                ),
                Text(
                  partner.email,
                  style: const TextStyle(
                    color: AppColors.grey,
                    fontSize: FontSize.sm,
                    height: 1.25,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationMethodSelection() {
    return SpacedColumn(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      space: Gap.xs,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Gap.sm),
          child: Text(
            locale.paymentDetailPage.labels.selectNotificationMethod,
            style: const TextStyle(
              color: AppColors.grey,
              fontSize: FontSize.sm,
              height: 1.25,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Gap.xxs),
          child: Wrap(
            spacing: Gap.md,
            runSpacing: Gap.sm,
            children: NotificationType.values
                .map(
                  (e) => DSRadioText(
                    value: e,
                    label: e.label,
                    selectedValue: notificationType,
                    onChanged: (_) {
                      onChangeNotificationType.call(e);
                    },
                  ),
                )
                .toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Gap.sm),
          child: Text(
            locale.paymentDetailPage.labels
                .notificationMethodDesc(value: notificationType.label),
            style: const TextStyle(
              color: AppColors.grey,
              fontSize: FontSize.xs,
              height: 1.25,
            ),
          ),
        ),
      ],
    );
  }
}

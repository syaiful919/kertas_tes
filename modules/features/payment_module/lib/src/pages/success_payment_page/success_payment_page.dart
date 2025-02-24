import 'package:core_module/core_module.dart';
import 'package:domain_module/domain_module.dart';
import 'package:flutter/material.dart';
import 'package:payment_module/src/const/payment_images.dart';
import 'package:payment_module/src/locale/strings.g.dart';
import 'package:payment_module/src/pages/success_payment_page/widgets/payment_details_card.dart';

import 'widgets/payment_status_card.dart';

class SuccessPaymentPage extends StatefulWidget {
  final PaymentReceiptEntity receipt;
  final VoidCallback onTapCreateNewPayment;

  const SuccessPaymentPage({
    super.key,
    required this.receipt,
    required this.onTapCreateNewPayment,
  });

  @override
  State<SuccessPaymentPage> createState() => _SuccessPaymentPageState();
}

class _SuccessPaymentPageState extends State<SuccessPaymentPage> {
  @override
  Widget build(BuildContext context) {
    return DSScaffold(
      backgroundColor: AppColors.white100,
      appBar: PlainAppbar(
        context: context,
        title: locale.successPaymentPage.title,
      ),
      body: SpacedColumn(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(Gap.md),
              children: [
                PaymentStatusCard(
                  receipt: widget.receipt,
                  onTapDetail: _onTapSeeStatusDetail,
                ),
                const SizedBox(height: Gap.md),
                InformationSummaryCard(
                  informations: widget.receipt.details,
                ),
                const SizedBox(height: Gap.md),
                _buildActionCard(),
                const SizedBox(height: Gap.md),
                _buildIsoImage(),
              ],
            ),
          ),
          _buildBottomSection(),
        ],
      ),
    );
  }

  Widget _buildActionCard() {
    return DSFlatCard(
      child: SpacedRow(
        children: [
          Expanded(
            child: DSActionButton(
              onPressed: () {
                _onTapDownload(
                  widget.receipt.receiptUrl,
                );
              },
              title: locale.general.buttons.download,
              icon: const Icon(
                Icons.download,
                color: AppColors.primary,
                size: FontSize.md,
              ),
            ),
          ),
          Container(
            height: 32,
            width: 1,
            color: AppColors.grey100,
          ),
          Expanded(
            child: DSActionButton(
              onPressed: _onTapShare,
              title: locale.general.buttons.share,
              icon: const Icon(
                Icons.share,
                color: AppColors.primary,
                size: FontSize.md,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIsoImage() {
    return Center(
      child: SizedBox(
        width: 200,
        child: FittedBox(
          child: SpacedRow(
            space: Gap.md,
            children: [
              Image.asset(
                PayementImages.isoWhite,
                height: 100,
              ),
              Image.asset(
                PayementImages.securityStandart,
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSection() {
    return Container(
      padding: const EdgeInsets.all(Gap.md),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(
          top: BorderSide(color: AppColors.grey100),
        ),
      ),
      child: DSButton(
        title: locale.successPaymentPage.buttons.newPayment,
        onPressed: widget.onTapCreateNewPayment,
      ),
    );
  }

  void _onTapDownload(String url) {
    PdfPreview.show(
      context: context,
      url: url,
    );
  }

  void _onTapShare() {
    // TODO: [out of scope] no UI provided
  }

  void _onTapSeeStatusDetail() {
    // TODO: [out of scope] no UI provided
  }
}

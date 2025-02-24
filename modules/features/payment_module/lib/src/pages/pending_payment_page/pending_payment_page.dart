import 'package:core_module/core_module.dart';
import 'package:domain_module/domain_module.dart';
import 'package:flutter/material.dart';
import 'package:payment_module/src/locale/strings.g.dart';
import 'package:payment_module/src/pages/pending_payment_page/bloc/pending_payment_page_event.dart';
import 'package:third_parties_module/flutter_bloc.dart';

import 'bloc/pending_payment_page_bloc.dart';
import 'bloc/pending_payment_page_state.dart';
import 'widgets/information_summary_card.dart';
import 'widgets/payment_instruction_card.dart';

class PendingPaymentPage extends StatefulWidget {
  final String paymentId;
  final Function(PaymentReceiptEntity receipt) onSuccess;

  const PendingPaymentPage({
    super.key,
    required this.paymentId,
    required this.onSuccess,
  });

  @override
  State<PendingPaymentPage> createState() => _PendingPaymentPageState();
}

class _PendingPaymentPageState extends State<PendingPaymentPage> {
  @override
  void initState() {
    super.initState();
    _loadInstruction();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PendingPaymentPageBloc, PendingPaymentPageState>(
      listener: (context, state) {
        if (state.errorMessage.isNotEmpty) {
          DSSnackBar.show(
            context: context,
            type: DSHighlightInfoType.error,
            message: state.errorMessage,
          );
          return;
        }

        final PaymentReceiptEntity? receipt = state.receipt;
        if (receipt != null) {
          widget.onSuccess.call(receipt);
          return;
        }
      },
      builder: (context, state) {
        return DSScaffold(
          isLoading: state.isChecking,
          backgroundColor: AppColors.white100,
          appBar: PlainAppbar(
            context: context,
            title: locale.pendingPaymentPage.title,
          ),
          body: ViewDataWidget<PaymentInstructionEntity>.state(
            state: state.instruction,
            onLoaded: (data) => SpacedColumn(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(Gap.md),
                    children: [
                      PaymentInstructionCard(
                        instruction: data,
                      ),
                      const SizedBox(height: Gap.md),
                      InformationSummaryCard(
                        informations: data.informations,
                      ),
                    ],
                  ),
                ),
                _buildBottomSection(),
              ],
            ),
            onErrorRetry: () {
              _loadInstruction();
            },
          ),
        );
      },
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
        title: locale.pendingPaymentPage.buttons.confirmPayment,
        onPressed: _checkPaymentStatus,
      ),
    );
  }

  void _loadInstruction() {
    context
        .read<PendingPaymentPageBloc>()
        .add(LoadPaymentInstruction(paymentId: widget.paymentId));
  }

  void _checkPaymentStatus() {
    context
        .read<PendingPaymentPageBloc>()
        .add(CheckPaymentStatus(paymentId: widget.paymentId));
  }
}

import 'package:core_module/core_module.dart';
import 'package:domain_module/domain_module.dart';
import 'package:flutter/material.dart';
import 'package:payment_module/src/locale/strings.g.dart';
import 'package:payment_module/src/pages/payment_detail_page/widgets/partner_account_card.dart';
import 'package:payment_module/src/pages/payment_detail_page/widgets/receiver_info_card.dart';
import 'package:third_parties_module/flutter_bloc.dart';

import 'bloc/payment_detail_page_bloc.dart';

class PaymentDetailPage extends StatefulWidget {
  final PartnerEntity partner;

  final void Function({
    BankAccountEntity? account,
    required void Function(BankAccountEntity) onSuccess,
  }) onTapAddBankAccount;
  final void Function(PaymentDetailEntity) onTapNext;

  const PaymentDetailPage({
    super.key,
    required this.onTapAddBankAccount,
    required this.partner,
    required this.onTapNext,
  });

  @override
  State<PaymentDetailPage> createState() => _PaymentDetailPageState();
}

class _PaymentDetailPageState extends State<PaymentDetailPage> {
  @override
  void initState() {
    super.initState();
    _onSetInitialPartner();
  }

  @override
  Widget build(BuildContext context) {
    return DSScaffold(
      backgroundColor: AppColors.white100,
      appBar: PlainAppbar(
        context: context,
        title: locale.paymentDetailPage.title,
      ),
      body: BlocBuilder<PaymentDetailPageBloc, PaymentDetailPageState>(
        builder: (context, state) {
          return SpacedColumn(
            children: [
              Expanded(
                child: _getBody(state),
              ),
              _buildBottomSection(state),
            ],
          );
        },
      ),
    );
  }

  Widget _getBody(PaymentDetailPageState state) {
    final PartnerEntity? partner = state.partner;
    if (partner == null) {
      return const SizedBox.shrink();
    }

    return ListView(
      padding: const EdgeInsets.all(Gap.md),
      children: [
        ReceiverInfoCard(
          partner: partner,
          notificationType: state.notificationType,
          onChangeNotificationType: _onChangeNotificationType,
          onChangeAmout: _onChangeAmout,
          onChangeNotes: _onChangeNotes,
        ),
        const SizedBox(height: Gap.md),
        PartnerAccountCard(
          account: state.bankAccount,
          onTapAdd: () {
            widget.onTapAddBankAccount.call(
              account: null,
              onSuccess: _onChangeBankAccount,
            );
          },
          onTapEdit: (account) {
            widget.onTapAddBankAccount.call(
              account: account,
              onSuccess: _onChangeBankAccount,
            );
          },
        )
      ],
    );
  }

  Widget? _buildBottomSection(PaymentDetailPageState state) {
    if (!state.isShowNextButton) {
      return null;
    }

    return Container(
      color: AppColors.primary,
      padding: const EdgeInsets.symmetric(
        horizontal: Gap.md,
        vertical: Gap.xs,
      ),
      child: SpacedRow(
        space: Gap.xs,
        children: [
          Expanded(
            child: SpacedColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              space: Gap.xxxs,
              children: [
                Text(
                  locale.paymentDetailPage.labels.total,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: FontSize.xs,
                  ),
                ),
                Text(
                  state.paymentAmount.currency(),
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: FontSize.md,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 150,
            child: DSButton(
              title: locale.paymentDetailPage.buttons.next,
              onPressed: () {
                PartnerEntity? partner = state.partner;
                BankAccountEntity? bankAccount = state.bankAccount;
                if (partner == null || bankAccount == null) {
                  return;
                }

                final result = PaymentDetailEntity(
                  partner: partner,
                  notificationType: state.notificationType,
                  paymentAmount: state.paymentAmount,
                  notes: state.notes,
                  receiverBankAccount: bankAccount,
                );
                widget.onTapNext.call(result);
              },
              color: AppColors.green,
            ),
          ),
        ],
      ),
    );
  }

  void _onSetInitialPartner() {
    context
        .read<PaymentDetailPageBloc>()
        .add(SetInitialPartner(partner: widget.partner));
  }

  void _onChangeBankAccount(BankAccountEntity account) {
    context
        .read<PaymentDetailPageBloc>()
        .add(ChangeBankAccount(account: account));
  }

  void _onChangeNotificationType(NotificationType value) {
    context
        .read<PaymentDetailPageBloc>()
        .add(ChangeNotificationType(type: value));
  }

  void _onChangeAmout(double value) {
    context
        .read<PaymentDetailPageBloc>()
        .add(ChangePaymentAmount(amount: value));
  }

  void _onChangeNotes(String value) {
    context.read<PaymentDetailPageBloc>().add(ChangeNotes(notes: value));
  }
}

import 'package:core_module/core_module.dart';
import 'package:domain_module/domain_module.dart';
import 'package:flutter/material.dart';
import 'package:payment_module/src/pages/bank_account_form_page/bank_account_form_page.dart';
import 'package:payment_module/src/pages/bank_account_form_page/bloc/bank_account_form_page_bloc.dart';
import 'package:payment_module/src/pages/list_bank_page/bloc/list_bank_page_bloc.dart';
import 'package:payment_module/src/pages/list_bank_page/list_bank_page.dart';
import 'package:payment_module/src/pages/partner_list_page/bloc/partner_list_page_bloc.dart';
import 'package:payment_module/src/pages/partner_list_page/partner_list_page.dart';
import 'package:payment_module/src/pages/payment_detail_page/bloc/payment_detail_page_bloc.dart';
import 'package:payment_module/src/pages/payment_detail_page/payment_detail_page.dart';
import 'package:payment_module/src/pages/payment_method_page/bloc/payment_method_page_bloc.dart';
import 'package:payment_module/src/pages/payment_method_page/payment_method_page.dart';
import 'package:payment_module/src/pages/pending_payment_page/bloc/pending_payment_page_bloc.dart';
import 'package:payment_module/src/pages/pending_payment_page/pending_payment_page.dart';
import 'package:payment_module/src/pages/success_payment_page/success_payment_page.dart';
import 'package:third_parties_module/flutter_bloc.dart';

class PaymentCoordinator {
  final BuildContext context;

  PaymentCoordinator({required this.context});

  Widget getPartnerListPage() {
    return BlocProvider(
      create: (_) => PartnerListPageBloc(
        paymentRepository: sl.get(),
      ),
      child: PartnerListPage(
        onSelectPartner: (partner) {
          BaseNav.push(
            context: context,
            page: _getPaymentDetailPage(partner),
          );
        },
      ),
    );
  }

  Widget _getPaymentDetailPage(PartnerEntity partner) {
    return BlocProvider(
      create: (context) => PaymentDetailPageBloc(),
      child: PaymentDetailPage(
        partner: partner,
        onTapAddBankAccount: ({
          BankAccountEntity? account,
          required void Function(BankAccountEntity) onSuccess,
        }) {
          BaseNav.push(
            context: context,
            page: _getBankAccountFormPage(
              account: account,
              onSuccess: (BankAccountEntity account) {
                BaseNav.pop(context: context);
                onSuccess.call(account);
              },
            ),
          );
        },
        onTapNext: (data) {
          BaseNav.push(
            context: context,
            page: _getPaymentMethodPage(data),
          );
        },
      ),
    );
  }

  Widget _getBankAccountFormPage({
    BankAccountEntity? account,
    required void Function(BankAccountEntity) onSuccess,
  }) {
    return BlocProvider(
      create: (context) => BankAccountFormPageBloc(
        paymentRepository: sl.get(),
      ),
      child: BankAccountFormPage(
        account: account,
        onSuccess: onSuccess,
        onTapSelectBank: ({
          required void Function(BankEntity) onSelected,
        }) {
          BaseNav.push(
            context: context,
            page: _getListBankPage(onSelected: (bank) {
              BaseNav.pop(context: context);
              onSelected.call(bank);
            }),
          );
        },
      ),
    );
  }

  Widget _getListBankPage({
    required Function(BankEntity) onSelected,
  }) {
    return BlocProvider(
      create: (context) => ListBankPageBloc(
        paymentRepository: sl.get(),
      ),
      child: ListBankPage(
        onSelected: onSelected,
      ),
    );
  }

  Widget _getPaymentMethodPage(PaymentDetailEntity paymentDetail) {
    return BlocProvider(
      create: (context) => PaymentMethodPageBloc(
        paymentRepository: sl.get(),
      ),
      child: PaymentMethodPage(
        paymentDetail: paymentDetail,
        onSuccess: (paymentId) {
          BaseNav.popToRoot(context: context);
          BaseNav.push(
            context: context,
            page: _getPendingPaymentPage(paymentId),
          );
        },
      ),
    );
  }

  Widget _getPendingPaymentPage(String paymentId) {
    return BlocProvider(
      create: (context) => PendingPaymentPageBloc(
        paymentRepository: sl.get(),
      ),
      child: PendingPaymentPage(
        paymentId: paymentId,
        onSuccess: (receipt) {
          BaseNav.pushReplacement(
            context: context,
            page: _getSuccessPaymentPage(receipt),
          );
        },
      ),
    );
  }

  Widget _getSuccessPaymentPage(PaymentReceiptEntity receipt) {
    return SuccessPaymentPage(
      receipt: receipt,
      onTapCreateNewPayment: () {
        BaseNav.pushReplacement(
          context: context,
          page: getPartnerListPage(),
        );
      },
    );
  }
}

import 'package:core_module/core_module.dart';
import 'package:domain_module/domain_module.dart';
import 'package:flutter/material.dart';
import 'package:payment_module/src/locale/strings.g.dart';
import 'package:payment_module/src/pages/bank_account_form_page/bloc/bank_account_form_page_bloc.dart';
import 'package:third_parties_module/flutter_bloc.dart';

class BankAccountFormPage extends StatefulWidget {
  final BankAccountEntity? account;

  final Function(BankAccountEntity) onSuccess;
  final Function({
    required Function(BankEntity) onSelected,
  }) onTapSelectBank;

  const BankAccountFormPage({
    super.key,
    required this.onSuccess,
    required this.onTapSelectBank,
    this.account,
  });

  @override
  State<BankAccountFormPage> createState() => _BankAccountFormPageState();
}

class _BankAccountFormPageState extends State<BankAccountFormPage> {
  @override
  void initState() {
    super.initState();
    _setInitialValue();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BankAccountFormPageBloc, BankAccountFormPageState>(
      listener: (context, state) {
        if (state.errorMessage.isNotEmpty) {
          DSSnackBar.show(
            context: context,
            type: DSHighlightInfoType.error,
            message: state.errorMessage,
          );
          return;
        }

        BankAccountEntity? validBankAccount = state.validBankAccount;
        if (validBankAccount != null) {
          DSSnackBar.show(
            context: context,
            type: DSHighlightInfoType.success,
            message: locale.bankAccountFormPage.messages.validationSuccess,
          );
          widget.onSuccess.call(validBankAccount);
          return;
        }
      },
      builder: (context, state) {
        return DSScaffold(
          isLoading: state.isSubmitting,
          backgroundColor: AppColors.white,
          appBar: PlainAppbar(
            context: context,
            title: locale.bankAccountFormPage.title,
          ),
          body: ListView(
            padding: const EdgeInsets.all(Gap.md),
            children: [
              TextFieldDropDown(
                value: state.bank?.name,
                isRequired: true,
                label: locale.bankAccountFormPage.labels.bankName,
                placeholder: locale.bankAccountFormPage.placeholders.selectBank,
                onTap: _onTapSelectBank,
              ),
              const SizedBox(height: Gap.md),
              DSTextField(
                initialValue: widget.account?.accountNumber,
                label: locale.bankAccountFormPage.labels.accountNumber,
                isRequired: true,
                keyboardType: TextInputType.number,
                placeholder:
                    locale.bankAccountFormPage.placeholders.sampleAccountNumber,
                onChanged: onChangeAccountNumber,
              ),
              const SizedBox(height: Gap.md),
              DSTextField(
                initialValue: widget.account?.accountName,
                label: locale.bankAccountFormPage.labels.accountName,
                isRequired: false,
                placeholder:
                    locale.bankAccountFormPage.placeholders.sampleAccountName,
                onChanged: onChangeAccountName,
              ),
              const SizedBox(height: Gap.md),
              DSButton(
                isEnabled: state.isSubmitButtonEnabled,
                title: locale.bankAccountFormPage.buttons.saveAccount,
                onPressed: _onSave,
              ),
            ],
          ),
        );
      },
    );
  }

  void _setInitialValue() {
    final BankAccountEntity? account = widget.account;
    if (account != null) {
      context
          .read<BankAccountFormPageBloc>()
          .add(SetInitialBankAccount(account: account));
    }
  }

  void onChangeAccountNumber(String value) {
    context
        .read<BankAccountFormPageBloc>()
        .add(ChangeAccountNumber(accountNumber: value));
  }

  void onChangeAccountName(String value) {
    context
        .read<BankAccountFormPageBloc>()
        .add(ChangeAccountName(accountName: value));
  }

  void _onTapSelectBank() {
    widget.onTapSelectBank.call(
      onSelected: (bank) {
        context.read<BankAccountFormPageBloc>().add(ChangeBank(bank: bank));
      },
    );
  }

  void _onSave() {
    context.read<BankAccountFormPageBloc>().add(SaveBankAccount());
  }
}

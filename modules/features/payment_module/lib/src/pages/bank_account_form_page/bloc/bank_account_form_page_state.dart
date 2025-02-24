part of 'bank_account_form_page_bloc.dart';

class BankAccountFormPageState {
  final BankEntity? bank;
  final String accountName;
  final String accountNumber;

  final bool isSubmitting;
  final BankAccountEntity? validBankAccount;
  final String errorMessage;

  const BankAccountFormPageState({
    this.accountNumber = '',
    this.accountName = '',
    this.isSubmitting = false,
    this.errorMessage = '',
    this.bank,
    this.validBankAccount,
  });

  bool get isSubmitButtonEnabled {
    return bank != null && AppRegex.integer.hasMatch(accountNumber.trim());
  }

  BankAccountFormPageState copyWith({
    BankEntity? bank,
    String? accountName,
    String? accountNumber,
    bool? isSubmitting,
    BankAccountEntity? validBankAccount,
    String? errorMessage,
  }) {
    return BankAccountFormPageState(
      bank: bank ?? this.bank,
      accountName: accountName ?? this.accountName,
      accountNumber: accountNumber ?? this.accountNumber,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      validBankAccount: validBankAccount ?? this.validBankAccount,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

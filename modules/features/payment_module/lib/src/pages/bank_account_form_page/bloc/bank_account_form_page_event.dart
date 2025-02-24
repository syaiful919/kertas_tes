part of 'bank_account_form_page_bloc.dart';

sealed class BankAccountFormPageEvent {}

final class SaveBankAccount extends BankAccountFormPageEvent {}

final class SetInitialBankAccount extends BankAccountFormPageEvent {
  final BankAccountEntity account;

  SetInitialBankAccount({required this.account});
}

final class ChangeBank extends BankAccountFormPageEvent {
  final BankEntity bank;

  ChangeBank({required this.bank});
}

final class ChangeAccountName extends BankAccountFormPageEvent {
  final String accountName;

  ChangeAccountName({required this.accountName});
}

final class ChangeAccountNumber extends BankAccountFormPageEvent {
  final String accountNumber;

  ChangeAccountNumber({required this.accountNumber});
}

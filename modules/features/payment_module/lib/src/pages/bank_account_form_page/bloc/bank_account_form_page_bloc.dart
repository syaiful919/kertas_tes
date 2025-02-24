import 'dart:async';
import 'package:core_module/core_module.dart';
import 'package:domain_module/domain_module.dart';
import 'package:third_parties_module/flutter_bloc.dart';

part 'bank_account_form_page_event.dart';
part 'bank_account_form_page_state.dart';

class BankAccountFormPageBloc
    extends Bloc<BankAccountFormPageEvent, BankAccountFormPageState> {
  final PaymentRepository paymentRepository;

  BankAccountFormPageBloc({
    required this.paymentRepository,
  }) : super(const BankAccountFormPageState()) {
    on<SetInitialBankAccount>(_onSetInitialAccount);
    on<ChangeBank>(_onChangeBank);
    on<ChangeAccountName>(_onChangeAccountName);
    on<ChangeAccountNumber>(_onChangeAccountNumber);
    on<SaveBankAccount>(_saveBankAccount);
  }

  void _onSetInitialAccount(SetInitialBankAccount event, emit) {
    emit(
      BankAccountFormPageState(
        accountName: event.account.accountName,
        accountNumber: event.account.accountNumber,
        bank: event.account.bank,
      ),
    );
  }

  void _onChangeBank(ChangeBank event, emit) {
    emit(
      state.copyWith(bank: event.bank),
    );
  }

  void _onChangeAccountName(ChangeAccountName event, emit) {
    emit(
      state.copyWith(accountName: event.accountName),
    );
  }

  void _onChangeAccountNumber(ChangeAccountNumber event, emit) {
    emit(
      state.copyWith(accountNumber: event.accountNumber),
    );
  }

  Future<void> _saveBankAccount(SaveBankAccount event, emit) async {
    final BankEntity? bank = state.bank;
    if (bank == null) {
      return;
    }

    emit(
      state.copyWith(
        isSubmitting: true,
        errorMessage: '',
      ),
    );

    String accountNumber = state.accountNumber.trim();
    String accountName = state.accountName.trim();

    final request = BankAccountRequest(
      bank: bank,
      accountNumber: accountNumber,
      accountName: accountName,
    );

    final resultCall = await paymentRepository.validateBankAccount(request);

    resultCall.when(
      onSuccess: (BankAccountEntity data) {
        emit(
          state.copyWith(
            isSubmitting: false,
            validBankAccount: data,
          ),
        );
      },
      onError: (String message) {
        emit(
          state.copyWith(
            isSubmitting: false,
            errorMessage: message,
          ),
        );
      },
    );
  }
}

import 'package:core_module/core_module.dart';
import 'package:domain_module/domain_module.dart';

class PendingPaymentPageState {
  final ViewState<PaymentInstructionEntity> instruction;

  final bool isChecking;
  final PaymentReceiptEntity? receipt;
  final String errorMessage;

  PendingPaymentPageState({
    required this.instruction,
    this.isChecking = false,
    this.receipt,
    this.errorMessage = '',
  });

  PendingPaymentPageState copyWith({
    ViewState<PaymentInstructionEntity>? instruction,
    bool? isChecking,
    PaymentReceiptEntity? receipt,
    String? errorMessage,
  }) {
    return PendingPaymentPageState(
      instruction: instruction ?? this.instruction,
      isChecking: isChecking ?? this.isChecking,
      receipt: receipt ?? this.receipt,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

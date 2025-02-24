sealed class PendingPaymentPageEvent {}

final class CheckPaymentStatus extends PendingPaymentPageEvent {
  final String paymentId;

  CheckPaymentStatus({required this.paymentId});
}

final class LoadPaymentInstruction extends PendingPaymentPageEvent {
  final String paymentId;

  LoadPaymentInstruction({required this.paymentId});
}

import 'package:domain_module/src/entities/general/enums/notification_type.dart';

class ProcessPaymentRequest {
  final String partnerId;
  final NotificationType notificationType;
  final double totalAmount;
  final String bankAccountId;
  final String paymentMethodId;
  final String? notes;

  const ProcessPaymentRequest({
    required this.partnerId,
    required this.notificationType,
    required this.totalAmount,
    required this.bankAccountId,
    required this.paymentMethodId,
    this.notes,
  });

  Map<String, dynamic> getMap() {
    return {
      'partner_id': partnerId,
      'notification_type': notificationType.key,
      'total_amount': totalAmount,
      'bank_account_id': bankAccountId,
      'payment_method_id': paymentMethodId,
      'notes': notes,
    };
  }
}

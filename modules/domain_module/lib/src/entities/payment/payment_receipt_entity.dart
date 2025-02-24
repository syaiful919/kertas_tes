import 'package:domain_module/src/entities/payment/payment_info_entity.dart';

import 'enums/payment_status.dart';

class PaymentReceiptEntity {
  final PaymentStatus paymentStatus;
  final String paymentMethodName;
  final String iconUrl;
  final String receiptUrl;
  final List<PaymentInfoEntity> details;

  const PaymentReceiptEntity({
    required this.paymentStatus,
    required this.paymentMethodName,
    required this.iconUrl,
    required this.receiptUrl,
    required this.details,
  });
}

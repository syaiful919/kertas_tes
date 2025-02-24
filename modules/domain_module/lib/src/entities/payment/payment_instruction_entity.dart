import 'package:domain_module/domain_module.dart';

class PaymentInstructionEntity {
  final PaymentMethodType paymentMethodType;
  final String paymentMethodName;
  final String bankAccountName;
  final String bankAccountNumber;
  final String iconUrl;
  final double totalAmount;
  final List<PaymentInfoEntity> informations;

  const PaymentInstructionEntity({
    required this.paymentMethodName,
    required this.bankAccountName,
    required this.bankAccountNumber,
    required this.paymentMethodType,
    required this.iconUrl,
    required this.totalAmount,
    required this.informations,
  });
}

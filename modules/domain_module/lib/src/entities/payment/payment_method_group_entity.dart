import 'package:domain_module/domain_module.dart';

class PaymentMethodGroupEntity {
  final PaymentMethodType type;
  final String name;
  final String disbursementEstimation;
  final String iconUrl;
  final List<PaymentMethodEntity> methods;

  const PaymentMethodGroupEntity({
    required this.type,
    required this.name,
    required this.disbursementEstimation,
    required this.iconUrl,
    required this.methods,
  });
}

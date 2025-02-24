import 'package:core_module/core_module.dart';
import 'package:domain_module/src/locale/strings.g.dart';

import 'enums/fee_type.dart';
import 'enums/payment_method_type.dart';

class PaymentMethodEntity {
  final String id;
  final PaymentMethodType type;
  final String name;
  final FeeType feeType;
  final double fee;
  final String disbursementEstimation;
  final String iconUrl;

  const PaymentMethodEntity({
    required this.id,
    required this.type,
    required this.name,
    required this.feeType,
    required this.fee,
    required this.disbursementEstimation,
    required this.iconUrl,
  });

  String get priceFormatted {
    if (fee == 0) {
      return locale.paymentMethod.free;
    }

    String prefix = locale.paymentMethod.fee;

    if (feeType == FeeType.percentage) {
      return "$prefix $fee%";
    }

    return "$prefix ${fee.currency()}";
  }
}

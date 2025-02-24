import 'package:core_module/core_module.dart';
import 'package:domain_module/domain_module.dart';

class PaymentMethodPageState {
  final PaymentDetailEntity? paymentDetail;
  final ViewState<List<PaymentMethodGroupEntity>> paymentMethods;
  final PaymentMethodEntity? selectedPaymentMethod;

  final bool isSubmitting;
  final String? paymentId;
  final String errorMessage;

  const PaymentMethodPageState({
    required this.paymentMethods,
    this.selectedPaymentMethod,
    this.isSubmitting = false,
    this.errorMessage = '',
    this.paymentDetail,
    this.paymentId,
  });

  bool get isShowNextButton => selectedPaymentMethod != null;
  double get totalAmount {
    final double? paymentAmount = paymentDetail?.paymentAmount;
    if (paymentAmount == null) {
      return 0;
    }

    final PaymentMethodEntity? method = selectedPaymentMethod;
    if (method == null) {
      return 0;
    }

    if (method.feeType == FeeType.percentage) {
      return paymentAmount + (paymentAmount * method.fee * 0.01).ceil();
    }

    return paymentAmount + method.fee;
  }

  PaymentMethodPageState copyWith({
    PaymentDetailEntity? paymentDetail,
    ViewState<List<PaymentMethodGroupEntity>>? paymentMethods,
    PaymentMethodEntity? selectedPaymentMethod,
    bool? isSubmitting,
    String? paymentId,
    String? errorMessage,
  }) {
    return PaymentMethodPageState(
      paymentDetail: paymentDetail ?? this.paymentDetail,
      paymentMethods: paymentMethods ?? this.paymentMethods,
      selectedPaymentMethod:
          selectedPaymentMethod ?? this.selectedPaymentMethod,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      paymentId: paymentId ?? this.paymentId,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

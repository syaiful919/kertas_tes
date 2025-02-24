import 'package:domain_module/domain_module.dart';

sealed class PaymentMethodPageEvent {}

final class GetPaymentMethodList extends PaymentMethodPageEvent {
  GetPaymentMethodList();
}

final class SetPaymentDetail extends PaymentMethodPageEvent {
  final PaymentDetailEntity paymentDetail;

  SetPaymentDetail({required this.paymentDetail});
}

final class SelectPaymentMethod extends PaymentMethodPageEvent {
  final PaymentMethodEntity method;

  SelectPaymentMethod({required this.method});
}

final class ProcessPayment extends PaymentMethodPageEvent {}

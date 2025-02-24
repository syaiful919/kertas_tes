part of 'payment_detail_page_bloc.dart';

class PaymentDetailPageState {
  final PartnerEntity? partner;
  final NotificationType notificationType;
  final double paymentAmount;
  final String? notes;
  final BankAccountEntity? bankAccount;

  PaymentDetailPageState({
    this.notificationType = NotificationType.whatsapp,
    this.paymentAmount = 0,
    this.partner,
    this.notes,
    this.bankAccount,
  });

  bool get isShowNextButton {
    return paymentAmount > 0 && partner != null && bankAccount != null;
  }

  PaymentDetailPageState copyWith({
    PartnerEntity? partner,
    NotificationType? notificationType,
    double? paymentAmount,
    String? notes,
    BankAccountEntity? bankAccount,
  }) {
    return PaymentDetailPageState(
      partner: partner ?? this.partner,
      notificationType: notificationType ?? this.notificationType,
      paymentAmount: paymentAmount ?? this.paymentAmount,
      notes: notes ?? this.notes,
      bankAccount: bankAccount ?? this.bankAccount,
    );
  }
}

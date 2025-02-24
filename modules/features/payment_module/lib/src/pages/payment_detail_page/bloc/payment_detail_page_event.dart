part of 'payment_detail_page_bloc.dart';

sealed class PaymentDetailPageEvent {}

final class SetInitialPartner extends PaymentDetailPageEvent {
  final PartnerEntity partner;

  SetInitialPartner({required this.partner});
}

final class ChangeBankAccount extends PaymentDetailPageEvent {
  final BankAccountEntity account;

  ChangeBankAccount({required this.account});
}

final class ChangeNotificationType extends PaymentDetailPageEvent {
  final NotificationType type;

  ChangeNotificationType({required this.type});
}

final class ChangePaymentAmount extends PaymentDetailPageEvent {
  final double amount;

  ChangePaymentAmount({required this.amount});
}

final class ChangeNotes extends PaymentDetailPageEvent {
  final String notes;

  ChangeNotes({required this.notes});
}

import 'package:domain_module/src/entities/general/enums/notification_type.dart';
import 'package:domain_module/src/entities/payment/bank_account_entity.dart';
import 'package:domain_module/src/entities/payment/partner_entity.dart';

class PaymentDetailEntity {
  final PartnerEntity partner;
  final NotificationType notificationType;
  final double paymentAmount;
  final String? notes;
  final BankAccountEntity receiverBankAccount;

  const PaymentDetailEntity({
    required this.partner,
    required this.notificationType,
    required this.paymentAmount,
    required this.receiverBankAccount,
    this.notes,
  });
}

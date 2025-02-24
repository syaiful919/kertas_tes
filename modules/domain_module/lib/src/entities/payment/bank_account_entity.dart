import 'bank_entity.dart';

class BankAccountEntity {
  final String id;
  final BankEntity bank;
  final String accountName;
  final String accountNumber;

  const BankAccountEntity({
    required this.id,
    required this.bank,
    required this.accountNumber,
    required this.accountName,
  });
}

import 'package:domain_module/domain_module.dart';

class BankAccountRequest {
  final BankEntity bank;
  final String accountName;
  final String accountNumber;

  const BankAccountRequest({
    required this.bank,
    required this.accountNumber,
    required this.accountName,
  });

  Map<String, dynamic> getMap() {
    return {
      'account_name': accountName,
      'account_number': accountNumber,
      'bank_id': bank.id,
    };
  }
}

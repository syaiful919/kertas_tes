import 'package:core_module/core_module.dart';
import 'package:datasource_module/src/models/payment/bank_model.dart';

class BankAccountModel extends NModel {
  late final String id;
  late final BankModel bank;
  late final String accountName;
  late final String accountNumber;

  BankAccountModel.fromJson(super.json) : super.fromJson();

  @override
  parse() {
    id = json.get('id').stringValue();
    bank = BankModel.fromJson(
      json.get('bank').jsonValue(),
    );
    accountName = json.get('account_name').stringValue();
    accountNumber = json.get('account_number').stringValue();
  }
}

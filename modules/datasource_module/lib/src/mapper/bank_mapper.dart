import 'package:datasource_module/src/models/payment/bank_account_model.dart';
import 'package:datasource_module/src/models/payment/bank_list_response_model.dart';
import 'package:datasource_module/src/models/payment/bank_model.dart';
import 'package:domain_module/domain_module.dart';

class PaymentMapper {
  List<BankEntity> mapBankListResponse(BankListResponseModel response) {
    return response.banks.map(_mapBank).toList();
  }

  BankAccountEntity mapBankAccount(BankAccountModel response) {
    return BankAccountEntity(
      id: response.id,
      bank: _mapBank(response.bank),
      accountNumber: response.accountNumber,
      accountName: response.accountName,
    );
  }

  BankEntity _mapBank(BankModel response) {
    return BankEntity(
      id: response.id,
      name: response.name,
    );
  }
}

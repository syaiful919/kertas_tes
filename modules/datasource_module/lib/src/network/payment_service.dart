import 'package:datasource_module/src/models/payment/bank_account_model.dart';
import 'package:datasource_module/src/models/payment/bank_list_response_model.dart';
import 'package:datasource_module/src/network/base/app_api.dart';
import 'package:datasource_module/src/network/base/app_endpoint.dart';
import 'package:domain_module/domain_module.dart';

class PaymentService extends AppApi {
  Future<BankListResponseModel> getBankList() async {
    return get(
      url: AppEndpoint.banks,
    ).then(
      (value) => value.transformData(
        (json) => BankListResponseModel.fromJson(json),
      ),
    );
  }

  Future<BankAccountModel> validateBankAccount(
    BankAccountRequest request,
  ) async {
    return post(
      url: AppEndpoint.bankAccount,
      pathParam: 'validate',
      params: request.getMap(),
    ).then(
      (value) => value.transformData(
        (json) => BankAccountModel.fromJson(json),
      ),
    );
  }
}

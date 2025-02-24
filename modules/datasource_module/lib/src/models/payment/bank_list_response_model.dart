import 'package:core_module/core_module.dart';

import 'bank_model.dart';

class BankListResponseModel extends NModel {
  late final List<BankModel> banks;

  BankListResponseModel.fromJson(super.json) : super.fromJson();

  @override
  parse() {
    banks = json
        .get('banks')
        .listDataValue()
        .map((e) => BankModel.fromJson(e.jsonValue()))
        .toList();
  }
}

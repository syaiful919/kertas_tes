import 'package:core_module/core_module.dart';

class BankModel extends NModel {
  late final String id;
  late final String name;

  BankModel.fromJson(super.json) : super.fromJson();

  @override
  parse() {
    name = json.get('name').stringValue();
    id = json.get('id').stringValue();
  }
}

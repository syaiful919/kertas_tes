import 'n_json.dart';

abstract class NModel {
  late NJson json;

  NModel.fromJson(this.json) {
    parse();
  }

  parse();
}

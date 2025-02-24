import 'dart:convert';

import 'n_data.dart';
import 'n_model.dart';

class NJson {
  Map<String, dynamic>? _jsonData;

  NJson({
    Map<String, dynamic>? jsonData,
  }) {
    _jsonData = jsonData;
  }

  String? getJsonString() {
    if (_jsonData == null) {
      return null;
    }

    return jsonEncode(_jsonData);
  }

  NData get(String key) {
    return NData(data: _jsonData?[key]);
  }

  T? getModel<T extends NModel>(
    T Function(NJson json) parser, {
    required String key,
  }) {
    dynamic data = _jsonData?[key];

    if (data != null && data is Map<String, dynamic>?) {
      return parser(NJson(jsonData: data));
    }

    return null;
  }
}

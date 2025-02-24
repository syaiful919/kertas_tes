import 'n_json.dart';
import 'n_model.dart';

class NData {
  dynamic _data;

  NData({
    dynamic data,
  }) {
    _data = data;
  }

  String stringValue() {
    if (_data is String) {
      return _data;
    }

    return "";
  }

  String? optStringValue() {
    if (_data != null) {
      return stringValue();
    }
    return null;
  }

  int intValue() {
    if (_data is int) {
      return _data;
    }

    return int.tryParse(_data.toString()) ?? 0;
  }

  int? optIntValue() {
    if (_data != null) {
      return intValue();
    }
    return null;
  }

  bool boolValue() {
    if (_data is bool) return _data;
    if (stringValue().toLowerCase() == "true") return true;
    if (intValue() == 1) return true;
    if (doubleValue() == 1.0) return true;

    return false;
  }

  bool? optBoolValue() {
    if (_data != null) {
      return boolValue();
    }
    return null;
  }

  double doubleValue() {
    if (_data is double) {
      return _data;
    }

    return double.tryParse(_data.toString()) ?? 0.0;
  }

  double? optDoubleValue() {
    if (_data != null) {
      return doubleValue();
    }
    return null;
  }

  NJson jsonValue() {
    if (_data is Map<String, dynamic>) {
      return NJson(jsonData: _data);
    }

    return NJson();
  }

  NJson? optJsonValue() {
    if (_data != null && (_data is Map || _data is List)) {
      return jsonValue();
    }

    return null;
  }

  T? getModel<T extends NModel>(
    T Function(NJson json) parser,
  ) {
    NJson? json = optJsonValue();

    if (json != null) {
      return parser(json);
    }

    return null;
  }

  List<NData> listDataValue() {
    if (_data is List<dynamic>) {
      List<dynamic> list = _data;
      return list.map((e) => NData(data: e)).toList();
    }

    return <NData>[];
  }
}

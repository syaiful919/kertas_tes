import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:third_parties_module/dio.dart';

import 'n_json.dart';
import 'n_model.dart';

class NResponse {
  final Response response;

  NResponse({
    required this.response,
  });

  factory NResponse.fromResponse(Response response) {
    return NResponse(
      response: response,
    );
  }

  @nonVirtual
  T getData<T extends NModel>(
    T Function(NJson json) fromJson,
  ) {
    return fromJson(NJson(jsonData: getJsonData()));
  }

  @nonVirtual
  T transformData<T extends NModel>(
    T Function(NJson json) fromJson,
  ) {
    return fromJson(NJson(jsonData: getJsonData()['data'] ?? {}));
  }

  @nonVirtual
  List<T> getList<T extends NModel>(
    T Function(NJson json) fromJson,
  ) {
    List<NJson> jsonList = getJsonList();
    return jsonList.map((e) => fromJson(e)).toList();
  }

  @nonVirtual
  List<T> transformListData<T extends NModel>(
    T Function(NJson json) fromJson,
  ) {
    try {
      return (getJsonData()['data'] as List<dynamic>)
          .map((e) => fromJson(NJson(jsonData: e)))
          .toList();
    } catch (_) {
      return <T>[];
    }
  }

  @nonVirtual
  Map<String, dynamic> getJsonData() {
    try {
      if (response.data is String) {
        return jsonDecode(response.data) as Map<String, dynamic>;
      } else if (response.data is Map) {
        return response.data;
      }

      return <String, dynamic>{};
    } catch (error) {
      debugPrint(error.toString());
      return <String, dynamic>{};
    }
  }

  @nonVirtual
  List<NJson> getJsonList() {
    try {
      return (response.data as List<dynamic>)
          .map((e) => NJson(jsonData: e))
          .toList();
    } catch (error) {
      debugPrint(error.toString());
      return <NJson>[];
    }
  }

  @nonVirtual
  num getStatusCode() {
    return response.statusCode ?? -1;
  }
}

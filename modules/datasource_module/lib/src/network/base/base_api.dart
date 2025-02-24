import 'package:core_module/core_module.dart';
import 'package:datasource_module/src/models/error_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'app_endpoint.dart';
import 'network_error_type.dart';

class BaseApi {
  final BaseNetworking _networking = BaseNetworking();

  @nonVirtual
  Future<NResponse> get({
    required AppEndpoint url,
    String? pathParam,
    Map<String, dynamic>? params,
    Map<String, String>? headers,
    int? timeout,
  }) {
    return _execute(
      () => _networking.get(
        url: url.getUrl(pathParam: pathParam),
        params: params,
        headers: headers,
        receiveTimeout: _getTimeout(timeout),
      ),
    );
  }

  @nonVirtual
  Future<NResponse> post({
    required AppEndpoint url,
    String? pathParam,
    Map<String, dynamic>? params,
    Map<String, String>? headers,
    int timeout = 8000,
  }) {
    return _execute(
      () => _networking.post(
        url: url.getUrl(pathParam: pathParam),
        params: params,
        headers: headers,
        receiveTimeout: timeout,
      ),
    );
  }

  @nonVirtual
  Future<NResponse> patch({
    required AppEndpoint url,
    String? pathParam,
    Map<String, dynamic>? params,
    Map<String, String>? headers,
  }) {
    return _execute(
      () => _networking.patch(
        url: url.getUrl(pathParam: pathParam),
        params: params,
        headers: headers,
      ),
    );
  }

  @nonVirtual
  Future<NResponse> put({
    required AppEndpoint url,
    String? pathParam,
    Map<String, dynamic>? params,
    Map<String, String>? headers,
  }) {
    return _execute(
      () => _networking.put(
        url: url.getUrl(pathParam: pathParam),
        params: params,
        headers: headers,
      ),
    );
  }

  @nonVirtual
  Future<NResponse> delete({
    required AppEndpoint url,
    String? pathParam,
    Map<String, String>? headers,
  }) {
    return _execute(
      () => _networking.delete(
        url: url.getUrl(pathParam: pathParam),
        headers: headers,
      ),
    );
  }

  Future<NResponse> _execute(Future<NResponse> Function() body) async {
    try {
      NetworkSetting.shared.setBaseUrl(getUrl());
      NResponse response = await body();
      num statusCode = response.getStatusCode();

      if (statusCode < 200 || statusCode > 299) {
        final ErrorResponseModel errorModel = ErrorResponseModel.fromJson(
          NJson(jsonData: response.getJsonData()),
        );

        NetworkErrorType? errorType = errorModel.getErrorCode.getType();

        if (errorType == NetworkErrorType.unauthorized) {
          // TODO: check if need to force logout
        }

        if (errorModel.messsageModel.message.isNotEmpty) {
          return Future.error(errorModel.messsageModel);
        } else {
          return Future.error(
            ErrorMesssageModel.fromType(NetworkErrorType.unknownError),
          );
        }
      }

      return response;
    } on NoNetworkException {
      return Future.error(
        ErrorMesssageModel.fromType(NetworkErrorType.noNetwork),
      );
    } on UnstableNetworkException {
      return Future.error(
        ErrorMesssageModel.fromType(NetworkErrorType.unstableNetwork),
      );
    } catch (e) {
      return Future.error(
        ErrorMesssageModel.fromType(NetworkErrorType.unknownError),
      );
    }
  }

  String getUrl() {
    return '';
  }

  int _getTimeout(int? timeout) {
    const int defaultTimeout =
        appFlavor == 'dev' || appFlavor == 'staging' ? 15000 : 8000;
    return timeout ?? defaultTimeout;
  }
}

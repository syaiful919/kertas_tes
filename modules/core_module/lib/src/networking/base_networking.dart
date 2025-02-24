import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:third_parties_module/cross_file.dart';
import 'package:third_parties_module/dio.dart';

import 'exceptions/general_network_exception.dart';
import 'exceptions/no_network_exception.dart';
import 'exceptions/unstable_network_exception.dart';
import 'models/n_response.dart';
import 'network_setting.dart';

const String _kRequestId = "requestId";

class BaseNetworking {
  final Dio _dio = Dio();
  late NetworkSetting _networkSetting;

  BaseNetworking({
    NetworkSetting? networkSetting,
  }) {
    _networkSetting = networkSetting ?? NetworkSetting.shared;
  }

  Future<NResponse> get({
    required String url,
    Map<String, dynamic>? params,
    Map<String, String>? headers,
    int? receiveTimeout,
  }) async {
    try {
      Response response = await _dio.get(
        _networkSetting.getUrl(url),
        queryParameters: params,
        options: Options(
          extra: {_kRequestId: _getRequestIdentifier(url)},
          headers: _networkSetting.getHeader(headers ?? {}),
          receiveTimeout: _getReceiveTimeout(receiveTimeout),
        ),
      );

      return Future.value(NResponse(response: response));
    } on DioException catch (e) {
      return _handleError(e);
    } catch (error) {
      return Future.error(error);
    }
  }

  Future<NResponse> post({
    required String url,
    Map<String, dynamic>? params,
    Map<String, String>? headers,
    int? receiveTimeout,
  }) async {
    try {
      Response response = await _dio.post(
        _networkSetting.getUrl(url),
        data: params,
        options: Options(
          extra: {_kRequestId: _getRequestIdentifier(url)},
          headers: _networkSetting.getHeader(headers ?? {}),
          receiveTimeout: _getReceiveTimeout(receiveTimeout),
        ),
      );

      return Future.value(NResponse(response: response));
    } on DioException catch (e) {
      return _handleError(e);
    } catch (error) {
      return Future.error(error);
    }
  }

  Future<NResponse> patch({
    required String url,
    Map<String, dynamic>? params,
    Map<String, String>? headers,
    int? receiveTimeout,
  }) async {
    try {
      Response response = await _dio.patch(
        _networkSetting.getUrl(url),
        data: params,
        options: Options(
          extra: {_kRequestId: _getRequestIdentifier(url)},
          headers: _networkSetting.getHeader(headers ?? {}),
          receiveTimeout: _getReceiveTimeout(receiveTimeout),
        ),
      );

      return Future.value(NResponse(response: response));
    } on DioException catch (e) {
      return _handleError(e);
    } catch (error) {
      return Future.error(error);
    }
  }

  Future<NResponse> put({
    required String url,
    Map<String, dynamic>? params,
    Map<String, String>? headers,
    int? receiveTimeout,
  }) async {
    try {
      Response response = await _dio.put(
        _networkSetting.getUrl(url),
        data: params,
        options: Options(
          extra: {_kRequestId: _getRequestIdentifier(url)},
          headers: _networkSetting.getHeader(headers ?? {}),
          receiveTimeout: _getReceiveTimeout(receiveTimeout),
        ),
      );

      return Future.value(NResponse(response: response));
    } on DioException catch (e) {
      return _handleError(e);
    } catch (error) {
      return Future.error(error);
    }
  }

  Future<NResponse> delete({
    required String url,
    Map<String, String>? headers,
    int? receiveTimeout,
  }) async {
    try {
      Response response = await _dio.delete(
        _networkSetting.getUrl(url),
        options: Options(
          extra: {_kRequestId: _getRequestIdentifier(url)},
          headers: _networkSetting.getHeader(headers ?? {}),
          receiveTimeout: _getReceiveTimeout(receiveTimeout),
        ),
      );

      return Future.value(NResponse(response: response));
    } on DioException catch (e) {
      return _handleError(e);
    } catch (error) {
      return Future.error(error);
    }
  }

  Future<NResponse> upload({
    required String url,
    required String key,
    required XFile file,
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    int? uploadTimeout,
    int? receiveTimeout,
  }) async {
    try {
      Map<String, dynamic> updatedParams = params ?? {};

      if (kIsWeb) {
        updatedParams[key] = MultipartFile.fromBytes(
          await file.readAsBytes(),
          filename: file.name,
        );
      } else {
        updatedParams[key] = await MultipartFile.fromFile(file.path);
      }

      FormData formData = FormData.fromMap(updatedParams);
      Response response = await _dio.post(
        _networkSetting.getUrl(url),
        data: formData,
        options: Options(
          extra: {_kRequestId: _getRequestIdentifier(url)},
          headers: _networkSetting.getHeader(headers ?? {}),
          receiveTimeout: _getReceiveTimeout(receiveTimeout),
        ),
      );

      return Future.value(NResponse(response: response));
    } on DioException catch (e) {
      return _handleError(e);
    } catch (error) {
      return Future.error(error);
    }
  }

  Future<NResponse> uploadMultiple({
    required String url,
    required String key,
    required List<XFile> files,
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    int? uploadTimeout,
    int? receiveTimeout,
  }) async {
    try {
      Map<String, dynamic> updatedParams = params ?? {};

      if (kIsWeb) {
        updatedParams[key] = files.map((file) async {
          return MultipartFile.fromBytes(
            await file.readAsBytes(),
            filename: file.name,
          );
        });
      } else {
        updatedParams[key] = files.map((file) async {
          return await MultipartFile.fromFile(file.path);
        });
      }

      FormData formData = FormData.fromMap(updatedParams);
      Response response = await _dio.post(
        _networkSetting.getUrl(url),
        data: formData,
        options: Options(
          extra: {_kRequestId: _getRequestIdentifier(url)},
          headers: _networkSetting.getHeader(headers ?? {}),
          receiveTimeout: _getReceiveTimeout(receiveTimeout),
        ),
      );

      return Future.value(NResponse(response: response));
    } on DioException catch (e) {
      return _handleError(e);
    } catch (error) {
      return Future.error(error);
    }
  }

  Future<NResponse> _handleError(DioException error) {
    Response? response = error.response;

    if (error.type == DioExceptionType.badResponse && response != null) {
      return Future.value(NResponse(response: response));
    } else if ([
      DioExceptionType.connectionTimeout,
      DioExceptionType.sendTimeout,
      DioExceptionType.receiveTimeout
    ].contains(error.type)) {
      return Future.error(UnstableNetworkException(error.message ?? ''));
    } else if (error.type == DioExceptionType.unknown &&
        error.error is SocketException) {
      return Future.error(NoNetworkException(error.message ?? ''));
    }

    return Future.error(GeneralNetworkException(error.message ?? ''));
  }

  String _getRequestIdentifier(String url) {
    DateTime now = DateTime.now();
    return "${_networkSetting.getUrl(url)}|${now.year}-${now.month}-${now.day}|${now.hour}:${now.minute}:${now.second}:${now.millisecond}:${now.microsecond}";
  }

  Duration? _getReceiveTimeout(int? timeout) {
    return timeout == null ? null : Duration(milliseconds: timeout);
  }
}

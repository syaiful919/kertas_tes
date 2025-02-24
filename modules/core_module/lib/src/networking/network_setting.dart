import 'package:flutter/foundation.dart';

class NetworkSetting {
  static NetworkSetting shared = NetworkSetting(
    baseUrl: "",
    baseHeader: <String, String>{},
  );

  String? _baseUrl;
  late Map<String, String> _baseHeader;

  NetworkSetting({
    String? baseUrl,
    Map<String, String>? baseHeader,
    bool isLoggerEnabled = kDebugMode,
  }) {
    _baseUrl = baseUrl;
    _baseHeader = baseHeader ?? NetworkSetting.shared._baseHeader;
  }

  Map<String, String> getHeader(Map<String, String> header) {
    Map<String, String> finalHeader = Map.from(_baseHeader);

    for (String element in header.keys) {
      finalHeader[element] = header[element] ?? "";
    }

    return finalHeader;
  }

  String getUrl(String url) {
    Uri uri = Uri.parse(url);
    String baseUrl = _baseUrl ?? "";

    if (uri.host.isNotEmpty && uri.hasScheme) {
      return url;
    }

    String sanitizedUrl = url.startsWith("/") ? url.replaceFirst("/", "") : url;
    return baseUrl + (sanitizedUrl.isNotEmpty ? "/$sanitizedUrl" : "");
  }

  NetworkSetting setBaseUrl(String url) {
    _baseUrl = url.endsWith("/") ? url.substring(0, url.length - 1) : url;
    return this;
  }

  NetworkSetting addDefaultHeader({
    required String key,
    required String value,
  }) {
    _baseHeader[key] = value;
    return this;
  }

  NetworkSetting removeDefaultHeader({required String key}) {
    _baseHeader.remove(key);
    return this;
  }

  NetworkSetting clearDefaultHeader() {
    _baseHeader.removeWhere((key, value) => true);
    return this;
  }
}

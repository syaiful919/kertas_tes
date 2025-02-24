enum NetworkErrorType {
  unknownError,
  unauthorized,
  noNetwork,
  unstableNetwork,
}

extension StringNetworkErrorTypeExtension on String? {
  NetworkErrorType? getType() {
    if (this == null) {
      return null;
    }

    List<NetworkErrorType> errors = NetworkErrorType.values
        .where((element) => element.getIdentifier() == this)
        .toList();

    if (errors.isEmpty) {
      return null;
    }

    return errors.first;
  }
}

extension NetworkErrorTypeExtension on NetworkErrorType {
  String getIdentifier() {
    /// Logic copied from: https://github.com/Ephenodrom/Dart-Basic-Utils/blob/master/lib/src/StringUtils.dart

    StringBuffer sb = StringBuffer();
    bool first = true;
    String rawValue = toString();
    String identifier = rawValue.split('.').last;
    for (int rune in identifier.runes) {
      String char = String.fromCharCode(rune);
      if (_isUpperCase(char) && !first) {
        sb.write('_');
        sb.write(char.toUpperCase());
      } else {
        first = false;
        sb.write(char.toUpperCase());
      }
    }
    return sb.toString();
  }

  String getMessage() {
    switch (this) {
      // TODO: update error message
      case NetworkErrorType.unauthorized:
        return "unauthorized";
      case NetworkErrorType.unknownError:
        return "something wrong";
      case NetworkErrorType.noNetwork:
        return "no network";
      case NetworkErrorType.unstableNetwork:
        return "unstable network";
    }
  }

  bool _isUpperCase(String s) {
    return s == s.toUpperCase();
  }
}

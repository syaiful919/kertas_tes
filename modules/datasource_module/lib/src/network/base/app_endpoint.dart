enum AppEndpoint {
  banks,
  bankAccount,
}

extension AppEndpointExtension on AppEndpoint {
  String getUrl({String? pathParam}) {
    String path = _getPath();

    if (pathParam != null) {
      path = '$path/$pathParam';
    }

    return path;
  }

  String _getPath() {
    switch (this) {
      // TODO: update endpoints
      case AppEndpoint.banks:
        return 'v1/banks';
      case AppEndpoint.bankAccount:
        return 'v1/bank-account';
    }
  }
}

class ResultCall<T, E> {
  final T? _data;
  final E? _error;

  ResultCall({T? data, E? error})
      : _data = data,
        _error = error;

  factory ResultCall.success(T data) {
    return ResultCall(data: data);
  }

  factory ResultCall.error(E error) {
    return ResultCall(error: error);
  }

  bool get hasData => _data != null;
  bool get hasError => _error != null;

  /// be careful. always check [hasData] before call this function
  T getData() => _data!;

  /// be careful. always check [hasError] before call this function
  E getError() => _error!;

  void when({
    required void Function(T data) onSuccess,
    required void Function(E errorMessage) onError,
  }) {
    if (hasError) {
      onError(_error as E);
      return;
    }

    onSuccess(_data as T);
  }
}

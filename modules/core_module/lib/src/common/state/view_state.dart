import 'state_type.dart';

/// To manage the view state into single container

class ViewState<T> {
  StateType _state = StateType.loading;
  String _error = "";
  late T _data;

  ViewState.loading() {
    _state = StateType.loading;
  }

  ViewState.empty() {
    _state = StateType.empty;
  }

  ViewState.error(String error) {
    _state = StateType.error;
    _error = error;
  }

  ViewState.success(T data) {
    _state = StateType.success;
    _data = data;
  }

  StateType getState() {
    return _state;
  }

  /// be careful, ensure [_state] is [StateType.error] before calling this

  String getError() {
    return _error;
  }

  /// be careful, ensure [_state] is [StateType.success] before calling this

  T getData() {
    return _data;
  }
}

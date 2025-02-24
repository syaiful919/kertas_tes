import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

/// Wrapper widget for [ViewState].
///
class ViewDataWidget<T> extends StatelessWidget {
  final Stream<ViewState<T>>? stream;
  final ViewState<T>? state;
  final Widget Function(T) onLoaded;
  final Widget Function()? onLoading;
  final Widget Function(String)? onError;
  final Widget Function()? onEmptyData;
  final Widget Function()? onInit;
  final void Function()? onErrorRetry;

  const ViewDataWidget._({
    required this.onLoaded,
    super.key,
    this.stream,
    this.state,
    this.onLoading,
    this.onError,
    this.onEmptyData,
    this.onInit,
    this.onErrorRetry,
  });

  /// handle [Stream] of [ViewState] with type [T]
  ///
  factory ViewDataWidget.stream({
    required Stream<ViewState<T>> stream,
    required Widget Function(T) onLoaded,
    Key? key,
    Widget Function()? onLoading,
    Widget Function(String)? onError,
    Widget Function()? onEmptyData,
    Widget Function()? onInit,
    void Function()? onErrorRetry,
  }) {
    return ViewDataWidget._(
      stream: stream,
      onLoaded: onLoaded,
      onEmptyData: onEmptyData,
      onLoading: onLoading,
      onInit: onInit,
      onErrorRetry: onErrorRetry,
      onError: onError,
    );
  }

  /// handle [ViewState] of type [T]
  ///
  factory ViewDataWidget.state({
    required ViewState<T> state,
    required Widget Function(T) onLoaded,
    Key? key,
    Widget Function()? onLoading,
    Widget Function(String)? onError,
    Widget Function()? onEmptyData,
    Widget Function()? onInit,
    void Function()? onErrorRetry,
  }) {
    return ViewDataWidget._(
      state: state,
      onLoaded: onLoaded,
      onEmptyData: onEmptyData,
      onLoading: onLoading,
      onInit: onInit,
      onErrorRetry: onErrorRetry,
      onError: onError,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (this.state == null && stream == null) {
      return const DefaultEmptyView();
    }

    final ViewState<T>? state = this.state;

    if (state != null) {
      final status = state.getState();

      switch (status) {
        case StateType.loading:
          return onLoading?.call() ?? _getLoadingDefault();
        case StateType.empty:
          return onEmptyData?.call() ?? const DefaultEmptyView();
        case StateType.error:
          final Widget Function(String)? errorCallback = onError;
          if (errorCallback != null) {
            return errorCallback.call(state.getError());
          }
          return _getErrorDefault(state.getError());
        case StateType.success:
          return onLoaded.call(state.getData());
        default:
          return onInit?.call() ?? const DefaultEmptyView();
      }
    }

    return StreamBuilder<ViewState<T>>(
      stream: stream,
      builder: ((context, snapshot) {
        if (!snapshot.hasData) return const DefaultEmptyView();

        final ViewState<T>? state = snapshot.data;

        if (state == null) return const DefaultEmptyView();

        switch (state.getState()) {
          case StateType.loading:
            return onLoading?.call() ?? _getLoadingDefault();
          case StateType.empty:
            return onEmptyData?.call() ?? const DefaultEmptyView();
          case StateType.error:
            final Widget Function(String)? errorCallback = onError;
            if (errorCallback != null) {
              return errorCallback.call(state.getError());
            }
            return _getErrorDefault(state.getError());
          case StateType.success:
            return onLoaded.call(state.getData());
          default:
            return onInit?.call() ?? const DefaultEmptyView();
        }
      }),
    );
  }

  Widget _getErrorDefault(String message) {
    return DefaultErrorView(
      message: message,
      onTapRetry: onErrorRetry,
    );
  }

  Widget _getLoadingDefault() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

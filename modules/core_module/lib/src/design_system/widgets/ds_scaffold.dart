import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

class DSScaffold extends StatelessWidget {
  final Widget? body;
  final PreferredSizeWidget? appBar;
  final Color? backgroundColor;
  final bool isLoading;

  const DSScaffold({
    super.key,
    this.body,
    this.appBar,
    this.backgroundColor,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: backgroundColor ?? AppColors.white,
          appBar: appBar,
          body: body,
        ),
        _getLoadingOverlay(),
      ],
    );
  }

  Widget _getLoadingOverlay() {
    if (!isLoading) {
      return const SizedBox.shrink();
    }
    return Positioned.fill(
      child: Container(
        alignment: Alignment.center,
        color: AppColors.black.withOpacity(0.25),
        child: const CircularProgressIndicator(
          color: AppColors.primary,
        ),
      ),
    );
  }
}

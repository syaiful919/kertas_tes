import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:payment_invoice_app/src/app_coordinator.dart';

class App extends StatelessWidget {
  final bool isLogin;

  const App({
    super.key,
    required this.isLogin,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
      ),
      home: Builder(
        builder: _getInitialPage,
      ),
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(1.0),
            ),
            child: child ?? const SizedBox.shrink(),
          ),
        );
      },
    );
  }

  Widget _getInitialPage(BuildContext context) {
    final appCoordinator = AppCoordinator(context);

    if (!isLogin) {
      return appCoordinator.authenticationCoordinator.getLoginPage();
    }

    return appCoordinator.getMainPage();
  }
}

import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:payment_invoice_app/src/main_page.dart';
import 'package:payment_module/payment_module.dart';
import 'package:authentication_module/authentication_module.dart';

class AppCoordinator {
  final BuildContext context;

  late final AuthenticationCoordinator authenticationCoordinator;
  late final PaymentCoordinator paymentCoordinator;

  AppCoordinator(this.context) {
    _setupCoordinator();
  }

  void _setupCoordinator() {
    authenticationCoordinator = AuthenticationCoordinator(context: context);
    paymentCoordinator = PaymentCoordinator(context: context);
  }

  Widget getMainPage() {
    return MainPage(onTapPayment: () {
      BaseNav.push(
        context: context,
        page: paymentCoordinator.getPartnerListPage(),
      );
    });
  }
}

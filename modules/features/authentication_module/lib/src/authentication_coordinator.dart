import 'package:authentication_module/src/pages/login_page/login_page.dart';
import 'package:flutter/material.dart';

class AuthenticationCoordinator {
  final BuildContext context;

  AuthenticationCoordinator({required this.context});

  Widget getLoginPage() {
    return const LoginPage();
  }
}

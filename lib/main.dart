import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/app_di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  AppDI.configure();

  bool isLogin = true;
  // TODO: [out of scope] check is login.

  runApp(App(
    isLogin: isLogin,
  ));
}

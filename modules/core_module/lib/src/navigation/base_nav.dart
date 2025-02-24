import 'package:flutter/material.dart';

/// Just a helper class to shorten navigation
///
class BaseNav {
  BaseNav._();

  static Future<T?> push<T>({
    required BuildContext context,
    required Widget page,
    String? name,
  }) {
    RouteSettings? settings;

    if (name != null) {
      settings = RouteSettings(name: name);
    }

    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page, settings: settings),
    );
  }

  static Future<T?> pushReplacement<T>({
    required BuildContext context,
    required Widget page,
    String? name,
  }) {
    RouteSettings? settings;

    if (name != null) {
      settings = RouteSettings(name: name);
    }

    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => page,
        settings: settings,
      ),
    );
  }

  static Future<T?> pushAndRemoveUntil<T>({
    required BuildContext context,
    required Widget page,
    required String until,
    String? name,
  }) {
    RouteSettings? settings;

    if (name != null) {
      settings = RouteSettings(name: name);
    }

    return Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => page,
        settings: settings,
      ),
      (route) => route.settings.name == until,
    );
  }

  static pop({required BuildContext context}) {
    Navigator.of(context).pop();
  }

  static popUntil({
    required BuildContext context,
    required String name,
  }) {
    Navigator.of(context).popUntil(
      (route) => route.settings.name == name,
    );
  }

  static popToRoot({
    required BuildContext context,
  }) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}

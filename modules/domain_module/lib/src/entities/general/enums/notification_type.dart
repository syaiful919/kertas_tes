import 'package:domain_module/src/locale/strings.g.dart';

enum NotificationType {
  whatsapp,
  sms;

  String get key {
    switch (this) {
      case NotificationType.whatsapp:
        return 'WHATSAPP';
      case NotificationType.sms:
        return 'SMS';
    }
  }

  String get label {
    switch (this) {
      case NotificationType.whatsapp:
        return locale.notificationType.whatsapp;
      case NotificationType.sms:
        return locale.notificationType.sms;
    }
  }
}

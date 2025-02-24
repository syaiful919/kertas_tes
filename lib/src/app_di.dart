import 'package:datasource_module/datasource_module.dart';

class AppDI {
  const AppDI._();

  static void configure() {
    DatasourceDI.configure();
  }
}

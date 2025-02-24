import 'package:core_module/core_module.dart';
import 'package:datasource_module/src/mapper/bank_mapper.dart';
import 'package:datasource_module/src/network/payment_service.dart';
import 'package:datasource_module/src/repositories/mocks/mock_payment_repository_impl.dart';
import 'package:domain_module/domain_module.dart';

class DatasourceDI {
  const DatasourceDI._();

  static void configure() {
    _configureMappers();
    _configureServices();
    _configureRepositories();
  }

  static void _configureMappers() {
    sl.registerFactory<PaymentMapper>(
      () => PaymentMapper(),
    );
  }

  static void _configureServices() {
    sl.registerFactory<PaymentService>(
      () => PaymentService(),
    );
  }

  static void _configureRepositories() {
    // TODO: [out of scope] configure setting page to enable toggling on runtime
    bool useMock = true;
    if (useMock) {
      _configureMockRepositories();
      return;
    }

    // TODO: currently have no access to the api, so use mock

    /*
    sl.registerFactory<PaymentRepository>(
      () => PaymentRepositoryImpl(
        paymentService: sl.get(),
        paymentMapper: sl.get(),
      ),
    );
    */
  }

  static void _configureMockRepositories() {
    sl.registerFactory<PaymentRepository>(
      () => MockPaymentRepositoryImpl(),
    );
  }
}

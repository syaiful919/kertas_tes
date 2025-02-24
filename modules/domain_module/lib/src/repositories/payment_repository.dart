import 'package:domain_module/src/entities/entities.dart';

abstract class PaymentRepository {
  const PaymentRepository();

  Future<ResultCall<List<PartnerEntity>, String>> getPartners();
  Future<ResultCall<List<BankEntity>, String>> getBanks();
  Future<ResultCall<BankAccountEntity, String>> validateBankAccount(
    BankAccountRequest request,
  );
  Future<ResultCall<List<PaymentMethodGroupEntity>, String>>
      getPaymentMethods();
  Future<ResultCall<String, String>> processPayment(
    ProcessPaymentRequest request,
  );
  Future<ResultCall<PaymentInstructionEntity, String>> getPaymentInstruction(
    String paymentId,
  );
  Future<ResultCall<PaymentReceiptEntity, String>> checkPaymentStatus(
    String paymentId,
  );
}

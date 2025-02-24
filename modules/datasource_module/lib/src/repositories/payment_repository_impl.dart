import 'package:datasource_module/src/mapper/bank_mapper.dart';
import 'package:datasource_module/src/models/error_model.dart';
import 'package:datasource_module/src/network/base/network_error_type.dart';
import 'package:datasource_module/src/network/payment_service.dart';
import 'package:domain_module/domain_module.dart';

class PaymentRepositoryImpl extends PaymentRepository {
  final PaymentService paymentService;
  final PaymentMapper paymentMapper;

  const PaymentRepositoryImpl({
    required this.paymentService,
    required this.paymentMapper,
  });

  @override
  Future<ResultCall<List<BankEntity>, String>> getBanks() async {
    try {
      final responses = await paymentService.getBankList();
      return ResultCall.success(
        paymentMapper.mapBankListResponse(responses),
      );
    } catch (e) {
      if (e is ErrorMesssageModel) {
        return ResultCall.error(e.message);
      }
      return ResultCall.error(NetworkErrorType.unknownError.getMessage());
    }
  }

  @override
  Future<ResultCall<BankAccountEntity, String>> validateBankAccount(
    BankAccountRequest request,
  ) async {
    try {
      final responses = await paymentService.validateBankAccount(request);
      return ResultCall.success(
        paymentMapper.mapBankAccount(responses),
      );
    } catch (e) {
      if (e is ErrorMesssageModel) {
        return ResultCall.error(e.message);
      }
      return ResultCall.error(NetworkErrorType.unknownError.getMessage());
    }
  }

  @override
  Future<ResultCall<List<PartnerEntity>, String>> getPartners() async {
    // TODO: implement getPartners
    throw UnimplementedError();
  }

  @override
  Future<ResultCall<String, String>> processPayment(
    ProcessPaymentRequest request,
  ) async {
    // TODO: implement processPayment
    throw UnimplementedError();
  }

  @override
  Future<ResultCall<List<PaymentMethodGroupEntity>, String>>
      getPaymentMethods() async {
    // TODO: implement getPaymentMethods
    throw UnimplementedError();
  }

  @override
  Future<ResultCall<PaymentInstructionEntity, String>> getPaymentInstruction(
    String paymentId,
  ) async {
    // TODO: implement getPaymentInstruction
    throw UnimplementedError();
  }

  @override
  Future<ResultCall<PaymentReceiptEntity, String>> checkPaymentStatus(
    String paymentId,
  ) async {
    // TODO: implement checkPaymentStatus
    throw UnimplementedError();
  }
}

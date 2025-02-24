import 'package:domain_module/domain_module.dart';

class MockPaymentRepositoryImpl extends PaymentRepository {
  @override
  Future<ResultCall<List<BankEntity>, String>> getBanks() async {
    await Future.delayed(const Duration(milliseconds: 500), () {});
    return ResultCall.success(
      List.generate(
        20,
        (i) => BankEntity(
          id: "id_$i",
          name: "Bank Rakyat $i",
        ),
      ),
    );
  }

  @override
  Future<ResultCall<List<PartnerEntity>, String>> getPartners() async {
    await Future.delayed(const Duration(milliseconds: 500), () {});
    return ResultCall.success(
      List.generate(
        20,
        (i) => PartnerEntity(
          id: "id_$i",
          name: "Nama Orang $i",
          phoneNumber: "08957237$i",
          email: "partner_$i@gmail.com",
        ),
      ),
    );
  }

  @override
  Future<ResultCall<String, String>> processPayment(
    ProcessPaymentRequest request,
  ) async {
    // [out of scope] UI not provided, so we throw error
    if (request.paymentMethodId == 'tokped') {
      return ResultCall.error(
        'metode pembayaran ini sedang tidak tersedia. Silahkan gunakan metode pembayaran lain',
      );
    }

    await Future.delayed(const Duration(milliseconds: 1000), () {});
    return ResultCall.success('paymentId');
  }

  @override
  Future<ResultCall<BankAccountEntity, String>> validateBankAccount(
    BankAccountRequest request,
  ) async {
    await Future.delayed(const Duration(milliseconds: 1000), () {});
    return ResultCall.success(
      BankAccountEntity(
        id: 'xxxxx',
        bank: request.bank,
        accountNumber: request.accountNumber,
        accountName: request.accountName.isNotEmpty
            ? request.accountName
            : "Paman Gober",
      ),
    );
  }

  @override
  Future<ResultCall<List<PaymentMethodGroupEntity>, String>>
      getPaymentMethods() async {
    List<PaymentMethodEntity> digital = const [
      PaymentMethodEntity(
        id: 'tokped',
        type: PaymentMethodType.digitalPayment,
        name: "CC & Non CC via Tokopedia",
        feeType: FeeType.percentage,
        fee: 1.45,
        disbursementEstimation: "Estimasi Pencairan 27 Feb 2025",
        iconUrl:
            'https://res.cloudinary.com/dem6vrsff/image/upload/v1740311235/paper/tokopedia_1_ebbs67.png',
      )
    ];
    List<PaymentMethodEntity> banks = const [
      PaymentMethodEntity(
        id: 'bri',
        type: PaymentMethodType.bankTransfer,
        name: "Bank BRI",
        feeType: FeeType.fixed,
        fee: 0,
        disbursementEstimation: '',
        iconUrl:
            'https://res.cloudinary.com/dem6vrsff/image/upload/v1740311234/paper/bank-bri_vq4xel.png',
      ),
      PaymentMethodEntity(
        id: 'bni',
        type: PaymentMethodType.bankTransfer,
        name: "Bank BNI",
        feeType: FeeType.fixed,
        fee: 0,
        disbursementEstimation: '',
        iconUrl:
            'https://res.cloudinary.com/dem6vrsff/image/upload/v1740311234/paper/bank-bni_ujd6nm.png',
      ),
      PaymentMethodEntity(
        id: 'bca',
        type: PaymentMethodType.bankTransfer,
        name: "Bank BCA",
        feeType: FeeType.fixed,
        fee: 0,
        disbursementEstimation: '',
        iconUrl:
            'https://res.cloudinary.com/dem6vrsff/image/upload/v1740311234/paper/bank-bca_r0khzs.png',
      ),
    ];

    List<PaymentMethodGroupEntity> data = [
      PaymentMethodGroupEntity(
        type: PaymentMethodType.digitalPayment,
        name: "Mitra Pembayaran Digital",
        disbursementEstimation: '',
        iconUrl:
            "https://res.cloudinary.com/dem6vrsff/image/upload/v1740309311/paper/Screenshot_2025-02-23_at_18.13.09_xmqvxo.png",
        methods: digital,
      ),
      PaymentMethodGroupEntity(
        type: PaymentMethodType.bankTransfer,
        name: "Transfer Bank/Virtual Account",
        disbursementEstimation: "Estimasi Pencairan 26 Feb 2025",
        iconUrl:
            "https://res.cloudinary.com/dem6vrsff/image/upload/v1740309311/paper/Screenshot_2025-02-23_at_18.13.47_nhz450.png",
        methods: banks,
      )
    ];

    return ResultCall.success(data);
  }

  @override
  Future<ResultCall<PaymentInstructionEntity, String>> getPaymentInstruction(
    String paymentId,
  ) async {
    await Future.delayed(const Duration(milliseconds: 1000), () {});

    return ResultCall.success(
      const PaymentInstructionEntity(
        paymentMethodName: "Bank BCA Manual Transfer",
        bankAccountName: "PT. Pakar Digital Global",
        bankAccountNumber: "0027 7999 77",
        paymentMethodType: PaymentMethodType.bankTransfer,
        iconUrl:
            "https://res.cloudinary.com/dem6vrsff/image/upload/v1740311234/paper/bank-bca_r0khzs.png",
        totalAmount: 3840000,
        informations: [
          PaymentInfoEntity(
            description: "Total Nominal",
            value: "Rp 3.840.000",
          ),
          PaymentInfoEntity(
            description: "Biaya Tambahan",
            value: "Gratis",
          ),
          PaymentInfoEntity(
            description: "Jumlah Tagihan",
            value: "Rp 3.840.000",
          ),
        ],
      ),
    );
  }

  @override
  Future<ResultCall<PaymentReceiptEntity, String>> checkPaymentStatus(
    String paymentId,
  ) async {
    await Future.delayed(const Duration(milliseconds: 1000), () {});
    return ResultCall.success(
      const PaymentReceiptEntity(
        paymentStatus: PaymentStatus.completed,
        paymentMethodName: "Bank BCA Manual Transfer",
        iconUrl:
            "https://res.cloudinary.com/dem6vrsff/image/upload/v1740311234/paper/bank-bca_r0khzs.png",
        receiptUrl:
            "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
        details: [
          PaymentInfoEntity(
            description: "Total Suplier",
            value: "3",
          ),
          PaymentInfoEntity(
            description: "Metode Pembayaran",
            value: "Bank Central Asia (BCA)",
          ),
          PaymentInfoEntity(
            description: "Tanggal Pembayaran",
            value: "20 September 2021, 09:34:00",
          ),
          PaymentInfoEntity(
            description: "Total Pembayaran",
            value: "Rp 3.840.000",
          ),
        ],
      ),
    );
  }
}

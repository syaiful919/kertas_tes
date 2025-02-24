import 'dart:async';
import 'package:core_module/core_module.dart';
import 'package:domain_module/domain_module.dart';
import 'package:third_parties_module/flutter_bloc.dart';

import 'payment_method_page_event.dart';
import 'payment_method_page_state.dart';

class PaymentMethodPageBloc
    extends Bloc<PaymentMethodPageEvent, PaymentMethodPageState> {
  final PaymentRepository paymentRepository;

  PaymentMethodPageBloc({
    required this.paymentRepository,
  }) : super(
          PaymentMethodPageState(paymentMethods: ViewState.loading()),
        ) {
    on<SetPaymentDetail>(_onSetPaymentDetail);
    on<SelectPaymentMethod>(_onSelectPaymentMethod);
    on<GetPaymentMethodList>(_onGetPaymentMethodList);
    on<ProcessPayment>(_onProcessPayment);
  }

  void _onSetPaymentDetail(SetPaymentDetail event, emit) {
    emit(
      state.copyWith(paymentDetail: event.paymentDetail),
    );
  }

  void _onSelectPaymentMethod(SelectPaymentMethod event, emit) {
    emit(
      state.copyWith(
        selectedPaymentMethod: event.method,
        errorMessage: '',
      ),
    );
  }

  Future<void> _onGetPaymentMethodList(event, emit) async {
    emit(
      state.copyWith(paymentMethods: ViewState.loading()),
    );

    final resultCall = await paymentRepository.getPaymentMethods();

    resultCall.when(
      onSuccess: (data) {
        if (data.isEmpty) {
          emit(
            state.copyWith(paymentMethods: ViewState.empty()),
          );
          return;
        }
        emit(
          state.copyWith(paymentMethods: ViewState.success(data)),
        );
      },
      onError: (message) {
        emit(
          state.copyWith(paymentMethods: ViewState.error(message)),
        );
      },
    );
  }

  Future<void> _onProcessPayment(event, emit) async {
    final PaymentDetailEntity? paymentData = state.paymentDetail;
    if (paymentData == null) {
      return;
    }

    final String? paymentMethodId = state.selectedPaymentMethod?.id;
    if (paymentMethodId == null) {
      return;
    }

    emit(
      state.copyWith(
        isSubmitting: true,
        errorMessage: '',
      ),
    );

    final request = ProcessPaymentRequest(
      partnerId: paymentData.partner.id,
      notificationType: paymentData.notificationType,
      totalAmount: paymentData.paymentAmount,
      bankAccountId: paymentData.receiverBankAccount.id,
      paymentMethodId: paymentMethodId,
      notes: paymentData.notes,
    );

    final resultCall = await paymentRepository.processPayment(request);

    resultCall.when(
      onSuccess: (String data) {
        emit(
          state.copyWith(
            isSubmitting: false,
            paymentId: data,
          ),
        );
      },
      onError: (String message) {
        emit(
          state.copyWith(
            isSubmitting: false,
            errorMessage: message,
          ),
        );
      },
    );
  }
}

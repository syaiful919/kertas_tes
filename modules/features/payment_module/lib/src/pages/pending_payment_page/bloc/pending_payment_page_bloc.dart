import 'dart:async';
import 'package:core_module/core_module.dart';
import 'package:domain_module/domain_module.dart';
import 'package:third_parties_module/flutter_bloc.dart';

import 'pending_payment_page_event.dart';
import 'pending_payment_page_state.dart';

class PendingPaymentPageBloc
    extends Bloc<PendingPaymentPageEvent, PendingPaymentPageState> {
  final PaymentRepository paymentRepository;

  PendingPaymentPageBloc({
    required this.paymentRepository,
  }) : super(
          PendingPaymentPageState(instruction: ViewState.loading()),
        ) {
    on<LoadPaymentInstruction>(_onLoadPaymentInstruction);
    on<CheckPaymentStatus>(_onCheckPaymentStatus);
  }

  Future<void> _onLoadPaymentInstruction(
    LoadPaymentInstruction event,
    emit,
  ) async {
    emit(
      state.copyWith(
        instruction: ViewState.loading(),
      ),
    );

    final resultCall = await paymentRepository.getPaymentInstruction(
      event.paymentId,
    );

    resultCall.when(
      onSuccess: (PaymentInstructionEntity data) {
        emit(
          state.copyWith(
            instruction: ViewState.success(data),
          ),
        );
      },
      onError: (String message) {
        emit(
          state.copyWith(
            instruction: ViewState.error(message),
          ),
        );
      },
    );
  }

  Future<void> _onCheckPaymentStatus(CheckPaymentStatus event, emit) async {
    emit(
      state.copyWith(
        errorMessage: '',
        isChecking: true,
      ),
    );

    final resultCall = await paymentRepository.checkPaymentStatus(
      event.paymentId,
    );

    resultCall.when(
      onSuccess: (PaymentReceiptEntity data) {
        emit(
          state.copyWith(
            receipt: data,
            isChecking: false,
          ),
        );
      },
      onError: (String message) {
        emit(
          state.copyWith(
            errorMessage: message,
            isChecking: false,
          ),
        );
      },
    );
  }
}

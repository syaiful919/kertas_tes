import 'package:domain_module/domain_module.dart';
import 'package:third_parties_module/flutter_bloc.dart';

part 'payment_detail_page_event.dart';
part 'payment_detail_page_state.dart';

class PaymentDetailPageBloc
    extends Bloc<PaymentDetailPageEvent, PaymentDetailPageState> {
  PaymentDetailPageBloc() : super(PaymentDetailPageState()) {
    on<SetInitialPartner>(_onSetInitialPartner);
    on<ChangeBankAccount>(_onChangeBankAccount);
    on<ChangeNotificationType>(_onChangeNotificationType);
    on<ChangePaymentAmount>(_onChangePaymentAmount);
    on<ChangeNotes>(_onChangeNotes);
  }

  void _onSetInitialPartner(SetInitialPartner event, emit) {
    emit(
      state.copyWith(partner: event.partner),
    );
  }

  void _onChangeBankAccount(ChangeBankAccount event, emit) {
    emit(
      state.copyWith(bankAccount: event.account),
    );
  }

  void _onChangeNotificationType(ChangeNotificationType event, emit) {
    emit(
      state.copyWith(notificationType: event.type),
    );
  }

  void _onChangePaymentAmount(ChangePaymentAmount event, emit) {
    emit(
      state.copyWith(paymentAmount: event.amount),
    );
  }

  void _onChangeNotes(ChangeNotes event, emit) {
    emit(
      state.copyWith(notes: event.notes),
    );
  }
}

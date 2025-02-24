import 'package:core_module/core_module.dart';
import 'package:domain_module/domain_module.dart';
import 'package:third_parties_module/flutter_bloc.dart';

import 'list_bank_page_event.dart';
import 'list_bank_page_state.dart';

class ListBankPageBloc extends Bloc<ListBankPageEvent, ListBankPageState> {
  final PaymentRepository paymentRepository;

  ListBankPageBloc({
    required this.paymentRepository,
  }) : super(ListBankPageState.init()) {
    on<GetListBankEvent>(_onGetBankList);
    on<SearchBankEvent>(_onSearch);
  }

  void _onSearch(SearchBankEvent event, emit) {
    if (state.banks.getState() != StateType.success) {
      return;
    }

    final (
      List<BankEntity> all,
      List<BankEntity> displayed,
    ) = state.banks.getData();

    List<BankEntity> updatedDisplayed =
        all.where((e) => e.name.toLowerCase().contains(event.keyword)).toList();

    emit(
      state.copyWith(
        keyword: event.keyword,
        banks: ViewState.success((all, updatedDisplayed)),
      ),
    );
  }

  Future<void> _onGetBankList(GetListBankEvent event, emit) async {
    emit(
      state.copyWith(banks: ViewState.loading()),
    );

    final resultCall = await paymentRepository.getBanks();

    resultCall.when(
      onSuccess: (List<BankEntity> data) {
        emit(
          state.copyWith(banks: ViewState.success((data, data))),
        );
      },
      onError: (String message) {
        emit(
          state.copyWith(banks: ViewState.error(message)),
        );
      },
    );
  }
}

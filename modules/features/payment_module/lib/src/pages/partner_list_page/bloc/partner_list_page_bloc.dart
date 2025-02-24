import 'dart:async';
import 'package:core_module/core_module.dart';
import 'package:domain_module/domain_module.dart';
import 'package:third_parties_module/flutter_bloc.dart';

import 'partner_list_page_event.dart';
import 'partner_list_page_state.dart';

class PartnerListPageBloc
    extends Bloc<PartnerListPageEvent, PartnerListPageState> {
  final PaymentRepository paymentRepository;

  PartnerListPageBloc({
    required this.paymentRepository,
  }) : super(PartnerListPageState.init()) {
    on<GetPartnerListEvent>(_onGetPartnerList);
    on<SearchPartnerEvent>(_onSearch);
  }

  void _onSearch(SearchPartnerEvent event, emit) {
    if (state.partners.getState() != StateType.success) {
      return;
    }

    final (
      List<PartnerEntity> all,
      List<PartnerEntity> displayed,
    ) = state.partners.getData();

    List<PartnerEntity> updatedDisplayed =
        all.where((e) => e.name.toLowerCase().contains(event.keyword)).toList();

    emit(
      state.copyWith(
        keyword: event.keyword,
        partners: ViewState.success((all, updatedDisplayed)),
      ),
    );
  }

  Future<void> _onGetPartnerList(GetPartnerListEvent event, emit) async {
    final resultCall = await paymentRepository.getPartners();

    resultCall.when(
      onSuccess: (List<PartnerEntity> data) {
        emit(
          state.copyWith(partners: ViewState.success((data, data))),
        );
      },
      onError: (String message) {
        emit(
          state.copyWith(partners: ViewState.error(message)),
        );
      },
    );
  }
}

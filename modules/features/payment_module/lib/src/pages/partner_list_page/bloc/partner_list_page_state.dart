import 'package:core_module/core_module.dart';
import 'package:domain_module/domain_module.dart';

class PartnerListPageState {
  final String keyword;
  final ViewState<
      (
        List<PartnerEntity> all,
        List<PartnerEntity> displayed,
      )> partners;

  const PartnerListPageState({
    required this.partners,
    this.keyword = '',
  });

  factory PartnerListPageState.init() {
    return PartnerListPageState(
      partners: ViewState.loading(),
    );
  }

  PartnerListPageState copyWith({
    String? keyword,
    ViewState<
            (
              List<PartnerEntity> all,
              List<PartnerEntity> displayed,
            )>?
        partners,
  }) {
    return PartnerListPageState(
      partners: partners ?? this.partners,
      keyword: keyword ?? this.keyword,
    );
  }
}

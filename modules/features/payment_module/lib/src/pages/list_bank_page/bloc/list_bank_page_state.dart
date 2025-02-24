import 'package:core_module/core_module.dart';
import 'package:domain_module/domain_module.dart';

class ListBankPageState {
  final String keyword;
  final ViewState<(List<BankEntity> all, List<BankEntity> displayed)> banks;

  const ListBankPageState({
    required this.banks,
    this.keyword = '',
  });

  factory ListBankPageState.init() {
    return ListBankPageState(
      banks: ViewState.loading(),
    );
  }

  ListBankPageState copyWith({
    String? keyword,
    ViewState<(List<BankEntity> all, List<BankEntity> displayed)>? banks,
  }) {
    return ListBankPageState(
      banks: banks ?? this.banks,
      keyword: keyword ?? this.keyword,
    );
  }
}

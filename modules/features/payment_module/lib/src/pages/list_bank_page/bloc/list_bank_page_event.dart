sealed class ListBankPageEvent {}

final class GetListBankEvent extends ListBankPageEvent {}

final class SearchBankEvent extends ListBankPageEvent {
  final String keyword;

  SearchBankEvent({required this.keyword});
}

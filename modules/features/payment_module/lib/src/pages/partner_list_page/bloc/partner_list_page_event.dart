sealed class PartnerListPageEvent {}

final class GetPartnerListEvent extends PartnerListPageEvent {}

final class SearchPartnerEvent extends PartnerListPageEvent {
  final String keyword;

  SearchPartnerEvent({required this.keyword});
}

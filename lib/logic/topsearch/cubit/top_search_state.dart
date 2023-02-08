part of 'top_search_cubit.dart';

enum Topsearchstatus { initial, loading, loaded, error }

class TopSearchState extends Equatable {
  const TopSearchState({required this.status, this.topsearchdata});
  final TopSearchModal? topsearchdata;
  final Topsearchstatus status;

  @override
  List<Object?> get props => [topsearchdata, status];
}

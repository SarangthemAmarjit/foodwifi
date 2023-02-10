part of 'search_restuarent_cubit.dart';

enum SearchStatus { initial, loading, loaded, error }

class SearchRestuarentState extends Equatable {
  const SearchRestuarentState(
      {required this.isempty,
      required this.isloading,
      required this.searchdata,
      required this.status});

  final SearchStatus status;
  final List<SearchRestuarentModal> searchdata;
  final bool isloading;
  final bool isempty;

  @override
  List<Object> get props => [searchdata, status];
}

part of 'fetch_restuarantlist_cubit.dart';

class FetchRestuarantlistState extends Equatable {
  const FetchRestuarantlistState({this.allrestuarantdata});
  final AllRestuarantModal? allrestuarantdata;

  @override
  List<Object?> get props => [allrestuarantdata];
}

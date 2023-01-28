part of 'fetchdatabloc_cubit.dart';

class FetchdatablocState extends Equatable {
  const FetchdatablocState(
      {required this.firstlistitems, required this.alldata});
  final List<Foodwifimodel> alldata;
  final List<List<Item?>> firstlistitems;

  @override
  List<Object> get props => [alldata, firstlistitems];
}

part of 'below_product_cubit_cubit.dart';

enum Status2 { initial, loading, loaded, error }

class BelowProductCubitState extends Equatable {
  const BelowProductCubitState(
      {required this.allbelowitems,
      required this.orialldata,
      required this.vegdata,
      required this.oneitem,
      required this.status,
      required this.alldata});
  final List<Productbelowmodel?> alldata;
  final List<Productbelowmodel?> orialldata;
  final List<ReviewModalModified> vegdata;
  final List<Productbelowmodel> oneitem;
  final List<ReviewModalModified> allbelowitems;

  final Status2 status;

  @override
  List<Object?> get props =>
      [alldata, vegdata, oneitem, orialldata, allbelowitems];
}

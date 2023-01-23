part of 'upperproduct_cubit_cubit.dart';

enum Status { initial, loading, loaded, error }

class UpperproductState extends Equatable {
  const UpperproductState({required this.status, this.upperdata});
  final Productuppermodel? upperdata;
  final Status status;

  @override
  List<Object?> get props => [upperdata, status];
}

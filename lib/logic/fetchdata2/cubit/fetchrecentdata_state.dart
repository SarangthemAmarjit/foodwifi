part of 'fetchrecentdata_cubit.dart';

class FetchallreviewState extends Equatable {
  const FetchallreviewState({
    this.productdetail,
    required this.isloading,
  });

  final bool isloading;

  final ReviewModal? productdetail;

  @override
  List<Object?> get props => [productdetail, isloading];
}

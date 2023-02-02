part of 'allreviewfetchrecentdata_cubit.dart';

enum Statusreview { initial, loading, loaded, error }

class FetchallreviewState extends Equatable {
  const FetchallreviewState({
    required this.statusreview,
    this.productdetail,
    required this.isloading,
  });

  final bool isloading;
  final Statusreview statusreview;
  final ReviewModal? productdetail;

  @override
  List<Object?> get props => [productdetail, isloading];
}

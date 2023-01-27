part of 'review_cubit.dart';

enum Status3 { initial, loading, loaded, error }

class DetailState extends Equatable {
  const DetailState({required this.status, this.productdetail});
  final ProductDetailModel? productdetail;
  final Status3 status;

  @override
  List<Object?> get props => [productdetail, status];
}

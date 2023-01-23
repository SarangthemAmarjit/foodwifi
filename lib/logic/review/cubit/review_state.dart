part of 'review_cubit.dart';

class ReviewState extends Equatable {
  const ReviewState({this.reviewdata});
  final ReviewModal? reviewdata;

  @override
  List<Object?> get props => [reviewdata];
}

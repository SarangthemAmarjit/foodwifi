import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodwifi/model/reviewmodal.dart';
import 'package:http/http.dart' as http;
part 'review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit() : super(const ReviewState());

  Future<void> getcustomerreview(String id) async {
    try {
      final queryParameters = {
        'id': id,
      };
      log('Id: ${id.toString()}');
      final baseHeader = {'Branchid': "1"};
      final response = await http.get(
          Uri.http('app.myfoodwifi.com', '/api/restaurants/reviewlist',
              queryParameters),
          headers: baseHeader);
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        var reviewdata = reviewModalFromJson(response.body);
        emit(ReviewState(reviewdata: reviewdata));

        log(' review ${reviewdata.toJson()}');

        log('Successfully get Upper Data');
      } else {
        log('Failed to Getdata.');
      }
    } catch (e) {
      log('review errror${e.toString()}');
    }
  }
}

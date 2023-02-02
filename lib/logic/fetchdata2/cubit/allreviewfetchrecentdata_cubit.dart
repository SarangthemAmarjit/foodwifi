import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodwifi/model/reviewmodal.dart';
import 'package:http/http.dart' as http;
part 'allreviewfetchrecentdata_state.dart';

class FetchallreviewCubit extends Cubit<FetchallreviewState> {
  FetchallreviewCubit()
      : super(const FetchallreviewState(
          isloading: true,
          statusreview: Statusreview.initial,
        ));
  bool get isLoading => state.statusreview == Statusreview.loading;

  Future<void> getdatalist({
    String? id,
    required int pagenumber,
    required int datalimit,
    required bool isMoredata,
  }) async {
    if (datalimit < 11) {
      if (isLoading) {
        return;
      }
      emit(FetchallreviewState(
          isloading: isMoredata, statusreview: Statusreview.loading));
    }

    log(id.toString());

    try {
      if (isMoredata) {
        log('Limit null : $datalimit');

        final queryParameters = {'id': id, "page": '1', "limit": '$datalimit'};
        final baseHeader = {'Branchid': "1"};
        final response = await http.get(
            Uri.http('app.myfoodwifi.com', '/api/restaurants/reviewlist',
                queryParameters),
            headers: baseHeader);
        if (response.statusCode == 200) {
          var productdeatails = reviewModalFromJson(response.body);

          if (productdeatails.review.length < datalimit) {
            log('item is lesss than $datalimit');
            isMoredata = false;
          }
          emit(FetchallreviewState(
              productdetail: productdeatails,
              isloading: isMoredata,
              statusreview: Statusreview.error));

          log('Successfully get Detail Data');
        } else {
          log('Failed to Getdata.');
          emit(FetchallreviewState(
              isloading: isMoredata, statusreview: Statusreview.error));
        }
      } else {
        log('No More Data');
      }
    } catch (e) {
      log(e.toString());
      emit(FetchallreviewState(
          isloading: isMoredata, statusreview: Statusreview.error));
    }
  }
}

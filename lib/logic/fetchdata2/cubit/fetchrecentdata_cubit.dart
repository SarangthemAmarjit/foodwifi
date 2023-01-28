import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodwifi/model/reviewmodal.dart';
import 'package:http/http.dart' as http;
part 'fetchrecentdata_state.dart';

class FetchallreviewCubit extends Cubit<FetchallreviewState> {
  FetchallreviewCubit()
      : super(const FetchallreviewState(
          isloading: true,
        ));

  Future<void> getdatalist(
      {String? id,
      required int pagenumber,
      required int datalimit,
      required bool isMoredata,
      String? lastdocument}) async {
    log(id.toString());

    try {
      if (isMoredata) {
        if (lastdocument != null) {
          log('Limit not null : $datalimit');

          final queryParameters = {
            'id': id,
            "page": '1',
            "limit": '$datalimit'
          };
          final baseHeader = {'Branchid': "1"};
          final response = await http.get(
              Uri.http('app.myfoodwifi.com', '/api/restaurants/reviewlist',
                  queryParameters),
              headers: baseHeader);
          if (response.statusCode == 200) {
            var productdeatails = reviewModalFromJson(response.body);

            lastdocument = productdeatails.review.last.toString();
            log('lastdocument not null${lastdocument.toString()}');

            if (productdeatails.review.length < datalimit) {
              log('item is lesss than $datalimit');
              isMoredata = false;
            }
            emit(FetchallreviewState(
                productdetail: productdeatails, isloading: isMoredata));

            log('Successfully get Detail Data');
          } else {
            log('Failed to Getdata.');
          }
        } else {
          log('Limit null : $datalimit');

          final queryParameters = {
            'id': id,
            "page": '1',
            "limit": '$datalimit'
          };
          final baseHeader = {'Branchid': "1"};
          final response = await http.get(
              Uri.http('app.myfoodwifi.com', '/api/restaurants/reviewlist',
                  queryParameters),
              headers: baseHeader);
          if (response.statusCode == 200) {
            var productdeatails = reviewModalFromJson(response.body);

            lastdocument = productdeatails.review.last.toString();
            log('lastdocument${lastdocument.toString()}');
            log('Length${productdeatails.review.length}');
            if (productdeatails.review.length < datalimit) {
              log('item is lesss than $datalimit');
              isMoredata = false;
            }
            emit(FetchallreviewState(
                productdetail: productdeatails, isloading: isMoredata));

            log('Successfully get Detail Data');
          } else {
            log('Failed to Getdata.');
          }
        }
      } else {
        log('No More Data');
      }
    } catch (e) {
      log(e.toString());
    }
  }
}

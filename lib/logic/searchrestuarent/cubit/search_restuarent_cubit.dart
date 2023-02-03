import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodwifi/model/searchmodal.dart';
import 'package:http/http.dart' as http;
part 'search_restuarent_state.dart';

class SearchRestuarentCubit extends Cubit<SearchRestuarentState> {
  SearchRestuarentCubit()
      : super(const SearchRestuarentState(
            searchdata: [], status: SearchStatus.initial, isloading: true));

  bool get isLoading => state.status == SearchStatus.loading;

  Future<List<SearchRestuarentModal>?> getsearchdata({
    required String itemname,
    required int page,
    required bool isMoredata,
  }) async {
    if (page < 2) {
      emit(const SearchRestuarentState(
          searchdata: [], status: SearchStatus.loading, isloading: true));
    }

    try {
      if (isMoredata) {
        final queryParameters = {
          '_search': itemname,
          'page': page.toString(),
          'lat': '24.805823',
          'lng': '93.942931',
          'sort_by': '',
          'cuisines': '',
          'store_type_id': '',
          'halal': '',
          'free_delivery': '',
          'promo': ''
        };
        final baseHeader = {'Branchid': "1"};
        final response = await http.get(
            Uri.http('app.myfoodwifi.com', '/api/restaurants/search',
                queryParameters),
            headers: baseHeader);

        if (response.statusCode == 200) {
          var allsearchdata = searchRestuarentModalFromJson(response.body);
          log('Successfully get Search Data');

          if (allsearchdata.length < 15) {
            log('item is lesss than ${allsearchdata.length}');
            isMoredata = false;
            emit(SearchRestuarentState(
                searchdata: allsearchdata,
                status: SearchStatus.loaded,
                isloading: false));
          } else {
            emit(SearchRestuarentState(
                searchdata: allsearchdata,
                status: SearchStatus.loaded,
                isloading: isMoredata));
          }
          return allsearchdata;
        } else {
          emit(const SearchRestuarentState(
              searchdata: [], status: SearchStatus.error, isloading: false));
          log('Failed to Getdata.');
        }
      } else {
        log('No More Data');
      }
    } catch (e) {
      emit(const SearchRestuarentState(
          searchdata: [], status: SearchStatus.error, isloading: false));
      log('product error ${e.toString()}');
    }
    return null;
  }
}

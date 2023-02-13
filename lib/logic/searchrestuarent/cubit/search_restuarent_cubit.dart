import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodwifi/model/searchmodal.dart';
import 'package:http/http.dart' as http;
part 'search_restuarent_state.dart';

class SearchRestuarentCubit extends Cubit<SearchRestuarentState> {
  SearchRestuarentCubit()
      : super(const SearchRestuarentState(
            searchdata: [],
            status: SearchStatus.initial,
            isloading: true,
            isempty: false));

  bool get isLoading => state.status == SearchStatus.loading;

  Future<List<SearchRestuarentModal>?> getsearchdata(
      {required String itemname,
      required int page,
      required bool isMoredata,
      required bool iscomigfromcheckbox,
      String? cuisinesid,
      String? allcuisinese,
      String? Storetypeid,
      String? soryby}) async {
    if (page < 2) {
      emit(const SearchRestuarentState(
          searchdata: [],
          status: SearchStatus.loading,
          isloading: true,
          isempty: false));
    }

    try {
      log('Sort by :$soryby');
      log('cuisine ID :$cuisinesid');
      log('Store ID :$Storetypeid');
      if (isMoredata) {
        final queryParameters = {
          '_search': itemname,
          'page': page.toString(),
          'lat': '24.805823',
          'lng': '93.942931',
          'sort_by': soryby,
          'cuisines': iscomigfromcheckbox ? allcuisinese : cuisinesid,
          'store_type_id': Storetypeid,
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
            if (allsearchdata.isEmpty) {
              emit(SearchRestuarentState(
                  searchdata: allsearchdata,
                  status: SearchStatus.loaded,
                  isloading: false,
                  isempty: true));
            } else {
              emit(SearchRestuarentState(
                  searchdata: allsearchdata,
                  status: SearchStatus.loaded,
                  isloading: false,
                  isempty: false));
            }
          } else {
            emit(SearchRestuarentState(
                searchdata: allsearchdata,
                status: SearchStatus.loaded,
                isloading: isMoredata,
                isempty: false));
          }
          return allsearchdata;
        } else {
          emit(const SearchRestuarentState(
              searchdata: [],
              status: SearchStatus.error,
              isloading: false,
              isempty: false));
          log('Failed to Getdata.');
        }
      } else {
        log('No More Data');
      }
    } catch (e) {
      emit(const SearchRestuarentState(
          searchdata: [],
          status: SearchStatus.error,
          isloading: false,
          isempty: false));
      log('product error ${e.toString()}');
    }
    return null;
  }
}

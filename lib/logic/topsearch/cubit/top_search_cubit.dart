import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodwifi/model/searchfiltermodal.dart';
import 'package:http/http.dart' as http;

part 'top_search_state.dart';

class TopSearchCubit extends Cubit<TopSearchState> {
  TopSearchCubit()
      : super(const TopSearchState(status: Topsearchstatus.initial));

  bool get isLoading => state.status == Topsearchstatus.loading;
  Future<void> gettopsearchdata() async {
    if (isLoading) {
      return;
    }
    emit(const TopSearchState(status: Topsearchstatus.loading));
    try {
      final baseHeader = {'Branchid': "1"};
      final response = await http.get(
          Uri.http(
            'app.myfoodwifi.com',
            '/api/restaurants/searchfilter',
          ),
          headers: baseHeader);

      if (response.statusCode == 200) {
        var data = TopSearchModalFromJson(response.body);
        emit(TopSearchState(
            status: Topsearchstatus.loaded, topsearchdata: data));
      } else {
        log('Failed to Getdata.');
        emit(const TopSearchState(
          status: Topsearchstatus.error,
        ));
      }
    } catch (e) {
      log(e.toString());
      emit(const TopSearchState(
        status: Topsearchstatus.error,
      ));
    }
  }
}

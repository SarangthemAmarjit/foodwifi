import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodwifi/model/restuarantlistmodal.dart';
import 'package:http/http.dart' as http;
part 'fetch_restuarantlist_state.dart';

class FetchRestuarantlistCubit extends Cubit<FetchRestuarantlistState> {
  FetchRestuarantlistCubit() : super(const FetchRestuarantlistState()) {
    getnewrestuarentlist();
  }

  Future<void> getnewrestuarentlist({String? sortoption}) async {
    log('coming first step');
    try {
      log('coming');
      final queryParameters = {
        'lng': '93.942931',
        'lat': '24.805823',
        'sort_by': sortoption ?? '1',
        'free_delivery': '',
        'cuisines': '',
        'halal': '',
        'store_type_id': '',
        'promo': ''
      };
      log('coming');
      final baseHeader = {'Branchid': "1"};
      final response = await http.get(
          Uri.http('app.myfoodwifi.com', 'api/restaurants/restaurantlist',
              queryParameters),
          headers: baseHeader);
      log(response.toString());
      log('allrestuarant: ${response.statusCode.toString()}');

      if (response.statusCode == 200) {
        log('done');
        var allres = allRestuarantModalFromJson(response.body);
        emit(FetchRestuarantlistState(allrestuarantdata: allres));

        log('Successfully get all restuarant Data');
      } else {
        emit(const FetchRestuarantlistState());

        log('Failed to Getdata.');
      }
    } catch (e) {
      log('allrestuarantdata errror${e.toString()}');
      emit(const FetchRestuarantlistState());
    }
  }
}

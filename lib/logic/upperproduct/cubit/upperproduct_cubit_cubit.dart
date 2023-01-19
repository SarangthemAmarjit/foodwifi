import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodwifi/model/upperproductmodel.dart';
import 'package:http/http.dart' as http;
part 'upperproduct_cubit_state.dart';

class UpperproductCubit extends Cubit<UpperproductState> {
  UpperproductCubit() : super(const UpperproductState()) {
    getupperproductdata();
  }

  Future<Productuppermodel?> getupperproductdata({String? id}) async {
    try {
      final queryParameters = {
        'lat': '24.805823',
        'lng': '93.942931',
      };
      if (id != null) {
        log('Id: ${id.toString()}');
        final baseHeader = {'Branchid': "1"};
        final response = await http.get(
            Uri.http(
                'app.myfoodwifi.com', '/api/restaurants/$id', queryParameters),
            headers: baseHeader);

        var data = jsonDecode(response.body) as Map<String, dynamic>;

        if (response.statusCode == 200) {
          var upperdata = Productuppermodel.fromJson(data);
          emit(UpperproductState(upperdata: upperdata));

          log(upperdata.title.toString());

          log('Successfully get Data');
          return upperdata;
        } else {
          log('Failed to Getdata.');
        }
      }
    } catch (e) {
      log('upper errror${e.toString()}');
    }
    return null;
  }
}

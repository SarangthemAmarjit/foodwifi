import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodwifi/model/upperproductmodel.dart';
import 'package:http/http.dart' as http;
part 'upperproduct_cubit_state.dart';

class UpperproductCubitCubit extends Cubit<UpperproductCubitState> {
  UpperproductCubitCubit() : super( UpperproductCubitState(alldata: ));

  Future<List<Productuppermodel>?> getalldata() async {
    try {
      final queryParameters = {
        'lat': '24.805823',
        'lng': '93.942931',
      };
      final baseHeader = {'Branchid': "1"};
      final response = await http.get(
          Uri.http('app.myfoodwifi.com', '/api/sites/getbranchcollection',
              queryParameters),
          headers: baseHeader);

      var data = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200) {
        var upperdata = Productuppermodel.fromJson(data);

        log(upperdata.toString());

        log('Successfully get Data');
        emit(UpperproductCubitState(alldata: upperdata));
      } else {
        log('Failed to Getdata.');
      }
      return null;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

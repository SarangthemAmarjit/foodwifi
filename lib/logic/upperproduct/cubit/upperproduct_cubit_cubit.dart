import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodwifi/model/upperproductmodel.dart';
import 'package:http/http.dart' as http;
part 'upperproduct_cubit_state.dart';

class UpperproductCubit extends Cubit<UpperproductState> {
  UpperproductCubit() : super(const UpperproductState(status: Status.initial));

  bool get isLoading => state.status == Status.loading;

  Future<void> getupperproductdata(String id) async {
    if (isLoading) {
      return;
    }
    emit(const UpperproductState(status: Status.loading));
    try {
      final queryParameters = {
        'lat': '24.805823',
        'lng': '93.942931',
      };
      log('Id: ${id.toString()}');
      final baseHeader = {'Branchid': "1"};
      final response = await http.get(
          Uri.http(
              'app.myfoodwifi.com', '/api/restaurants/$id', queryParameters),
          headers: baseHeader);
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        var upperdata = productuppermodelFromJson(response.body);
        emit(UpperproductState(upperdata: upperdata, status: Status.loaded));

        log(' upper ${upperdata!.toJson()}');

        log('Successfully get Upper Data');
      } else {
        emit(const UpperproductState(status: Status.error));
        log('Failed to Getdata.');
      }
    } catch (e) {
      log('upper errror${e.toString()}');
      emit(const UpperproductState(status: Status.error));
    }
  }
}

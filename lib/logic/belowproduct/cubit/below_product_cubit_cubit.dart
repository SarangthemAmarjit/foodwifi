import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodwifi/model/belowproductmodel.dart';
import 'package:http/http.dart' as http;
part 'below_product_cubit_state.dart';

class BelowProductCubitCubit extends Cubit<BelowProductCubitState> {
  BelowProductCubitCubit() : super(const BelowProductCubitState(alldata: [])) {
    getbelowproductdata();
  }

  Future<List<Productbelowmodel?>?> getbelowproductdata({String? id}) async {
    try {
      final queryParameters = {
        'id': id,
      };
      final baseHeader = {'Branchid': "1"};
      final response = await http.get(
          Uri.http('app.myfoodwifi.com', '/api/restaurants/categoryproduct',
              queryParameters),
          headers: baseHeader);
      log(response.body.toString());

      if (response.statusCode == 200) {
        var belowdata = productbelowmodelFromJson(response.body);

        log('Successfully get Data');
        log(response.body.toString());
        emit(BelowProductCubitState(alldata: belowdata!));
        return belowdata;
      } else {
        log('Failed to Getdata.');
      }
      return null;
    } catch (e) {
      log('product error ${e.toString()}');
    }
    return null;
  }
}

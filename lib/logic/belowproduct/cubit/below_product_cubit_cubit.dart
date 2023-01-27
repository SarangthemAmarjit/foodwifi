import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodwifi/model/allbelowmodel.dart';
import 'package:foodwifi/model/belowproductmodel.dart';
import 'package:foodwifi/services.dart';
import 'package:http/http.dart' as http;
part 'below_product_cubit_state.dart';

class BelowProductCubitCubit extends Cubit<BelowProductCubitState> {
  BelowProductCubitCubit()
      : super(const BelowProductCubitState(
          alldata: [],
          status: Status2.initial,
          oneitem: [],
          vegdata: [],
          orialldata: [],
          allbelowitems: [],
        ));

  bool get isLoading => state.status == Status2.loading;

  Future<void> getbelowproductdata(String id) async {
    if (isLoading) {
      return;
    }
    emit(const BelowProductCubitState(
        alldata: [],
        status: Status2.loading,
        oneitem: [],
        vegdata: [],
        orialldata: [],
        allbelowitems: []));
    try {
      final queryParameters = {
        'id': id,
      };
      final baseHeader = {'Branchid': "1"};
      final response = await http.get(
          Uri.http('app.myfoodwifi.com', '/api/restaurants/categoryproduct',
              queryParameters),
          headers: baseHeader);

      if (response.statusCode == 200) {
        List<ReviewModalModified> vegdata = [];
        List<Productbelowmodel> oneitem = [];
        var allbelowdata = jsonDecode(response.body) as List;

        var re = await ServiceApi().getcustomerreview(id);

        allbelowdata[0]['reviewdata'] = re;
        log("New Below$allbelowdata");

        var belowdata = productbelowmodelFromJson(response.body);
        var originaldata = productbelowmodelFromJson(response.body);
        var finalbelow =
            allbelowdata.map((e) => ReviewModalModified.fromJson(e)).toList();

        log('Successfully get new Data');
        for (var element in finalbelow) {
          if (element.reviewdata != null) {
            vegdata.add(element);
          } else {
            for (var element2 in element.products) {
              if (element2.type == 'veg') {
                if (vegdata.contains(element)) {
                  log('item contains already');
                } else {
                  vegdata.add(element);
                }
              }
            }
          }
        }

        oneitem.add(belowdata![0]!);
        belowdata.removeAt(0);

        emit(BelowProductCubitState(
            alldata: belowdata,
            status: Status2.loaded,
            oneitem: oneitem,
            vegdata: vegdata,
            orialldata: originaldata!,
            allbelowitems: finalbelow));
      } else {
        emit(const BelowProductCubitState(
            alldata: [],
            status: Status2.error,
            oneitem: [],
            vegdata: [],
            orialldata: [],
            allbelowitems: []));
        log('Failed to Getdata.');
      }
      return;
    } catch (e) {
      emit(const BelowProductCubitState(
          alldata: [],
          status: Status2.error,
          oneitem: [],
          vegdata: [],
          orialldata: [],
          allbelowitems: []));
      log('product error ${e.toString()}');
    }
    return;
  }
}

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodwifi/model/productdetail.dart';
import 'package:http/http.dart' as http;
part 'review_state.dart';

class DetailsCubit extends Cubit<DetailState> {
  DetailsCubit() : super(const DetailState(status: Status3.initial));
  bool get isloading => state.status == Status3.loading;

  Future<void> getproductdetails(String id) async {
    if (isloading) {
      return;
    }
    emit(const DetailState(status: Status3.loading));
    try {
      log('Id: ${id.toString()}');
      final baseHeader = {'Branchid': "1"};
      final response = await http.get(
          Uri.http(
            'app.myfoodwifi.com',
            '/api/products/$id',
          ),
          headers: baseHeader);
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        var productdeatails = productdetailFromJson(response.body);
        emit(DetailState(
            productdetail: productdeatails, status: Status3.loaded));

        log(' review ${productdeatails.toJson()}');

        log('Successfully get Detail Data');
      } else {
        log('Failed to Getdata.');
        emit(const DetailState(status: Status3.error));
      }
    } catch (e) {
      log('review errror${e.toString()}');
      emit(const DetailState(status: Status3.error));
    }
  }
}

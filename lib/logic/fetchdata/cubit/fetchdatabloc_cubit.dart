import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodwifi/model/model.dart';
import 'package:http/http.dart' as http;

part 'fetchdatabloc_state.dart';

class FetchdatablocCubit extends Cubit<FetchdatablocState> {
  FetchdatablocCubit()
      : super(const FetchdatablocState(alldata: [], firstlistitems: [])) {
    getalldata();
  }

  Future<List<Foodwifimodel>?> getalldata() async {
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

      var data = jsonDecode(response.body) as List;

      if (response.statusCode == 200) {
        var users = data.map((e) => Foodwifimodel.fromJson(e)).toList();
        var user2 = data.map((e) {
          List l1 = e['items'][0];
          var datamap = l1.map((e2) {
            return Item.fromJson(e2);
          }).toList();
          return datamap;
        }).toList();

        log(user2.toString());

        log('Successfully get Data');
        emit(FetchdatablocState(alldata: users, firstlistitems: user2));
        return users;
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

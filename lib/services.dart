import 'dart:developer';

import 'package:foodwifi/model/reviewmodal.dart';
import 'package:http/http.dart' as http;

class ServiceApi {
  Future<Map<String, dynamic>?> getcustomerreview(String id) async {
    try {
      final queryParameters = {
        'id': id,
      };
      log('Id: ${id.toString()}');
      final baseHeader = {'Branchid': "1"};
      final response = await http.get(
          Uri.http('app.myfoodwifi.com', '/api/restaurants/reviewlist',
              queryParameters),
          headers: baseHeader);
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        var reviewdata = reviewModalFromJson(response.body);
        var finaldata = reviewdata.toJson();

        log('Successfully get re Data');
        return finaldata;
      } else {
        log('Failed to Getdata.');
      }
    } catch (e) {
      log('review errror${e.toString()}');
    }
    return null;
  }
}

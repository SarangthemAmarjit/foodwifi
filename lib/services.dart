import 'dart:convert';
import 'dart:developer';

import 'package:foodwifi/model/allbelowmodel.dart';
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

  Future<List<ReviewModalModified>?> getbelowproductdata(String id) async {
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
        var allbelowdata = jsonDecode(response.body) as List;

        var re = await ServiceApi().getcustomerreview(id);

        allbelowdata[0]['reviewdata'] = re;

        var finalbelow =
            allbelowdata.map((e) => ReviewModalModified.fromJson(e)).toList();

        log('Successfully get new Data');

        return finalbelow;
      } else {
        log('Failed to Getdata.');
      }
    } catch (e) {
      log('product error ${e.toString()}');
    }
    return null;
  }
}


//  decoration: const BoxDecoration(
//                     color: Colors.white,
//                     boxShadow: [
//                       BoxShadow(
//                         spreadRadius: 2,
//                         color: Color.fromARGB(31, 115, 114, 114),
//                         offset: Offset(0.0, 5),
//                         blurRadius: 3,
//                       ),
//                     ],
//                   ),
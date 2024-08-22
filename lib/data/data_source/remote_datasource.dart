import 'dart:convert';

import 'package:food_app/core/constant_strings.dart';
import 'package:food_app/data/model/filter_model.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<(List<FilterModel>?, Exception?)> getFilterData();
}

class RemoteDatasourceImpl extends RemoteDataSource {
  RemoteDatasourceImpl(this.client);
  final http.Client client;

  @override
  Future<(List<FilterModel>?, Exception?)> getFilterData() async {
    try {
      final response = await client.get(Uri.parse(kAPiUrl));
      if (response.statusCode == 200) {
        final resp = jsonDecode(response.body) as Map;
        var filterList =
            (resp['data'] as List).map((e) => FilterModel.fromJson(e)).toList();

        return (filterList, null);
      } else {
        return (null, Exception('Something went wrong!'));
      }
    } catch (err) {
      throw Exception('Something went wrong');
    }
  }
}

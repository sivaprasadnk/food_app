import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/core/constant_strings.dart';
import 'package:food_app/data/model/filter_model.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<(List<FilterModel>?, Error?)> getFilterData();
}

class RemoteDatasourceImpl extends RemoteDataSource {
  RemoteDatasourceImpl(this.client);
  final http.Client client;

  @override
  Future<(List<FilterModel>?, Error?)> getFilterData() async {
    try {
      final response = await client.get(Uri.parse(kAPiUrl));
      if (response.statusCode == 200) {
        final resp = jsonDecode(response.body) as Map;
        var filterList =
            (resp['data'] as List).map((e) => FilterModel.fromJson(e)).toList();
        debugPrint('filterList :${filterList.length}');

        return (filterList, null);
      } else {
        return (null, Error());
      }
    } catch (err) {
      debugPrint('@@@ err :$err');
      throw Exception('Failed to load About Me details');
    }
  }
}

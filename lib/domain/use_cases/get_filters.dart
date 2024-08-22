import 'package:flutter/material.dart';
import 'package:food_app/data/repository/repository_impl.dart';
import 'package:food_app/domain/entity/filter.dart';

class GetFilters {
  GetFilters(this.repository);
  final RepositoryImpl repository;

  Future<(List<Filter>?, Error?)> call() async {
    debugPrint('@@ call');

    var resp = await repository.getFilterData();
    return (resp.$1, resp.$2);
  }
}

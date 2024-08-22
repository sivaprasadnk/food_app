import 'package:flutter/material.dart';
import 'package:food_app/core/locator.dart';
import 'package:food_app/domain/use_cases/get_filters.dart';

class FilterProvider extends ChangeNotifier {
  FilterProvider(
    this.getFilters,
  );
  final GetFilters getFilters;

  Future getData() async {
    debugPrint('@@ getData');
    return await locator<GetFilters>().call();
  }
}

import 'package:flutter/material.dart';
import 'package:food_app/core/locator.dart';
import 'package:food_app/domain/entity/filter.dart';
import 'package:food_app/domain/entity/taxonomy.dart';
import 'package:food_app/domain/use_cases/get_filters.dart';

class FilterProvider extends ChangeNotifier {
  List<Filter> _filterList = [];
  List<Filter> get filterList => _filterList;

  final List<Taxonomy> _selected = [];
  List<Taxonomy> get selected => _selected;

  FilterProvider(
    this.getFilters,
  );
  final GetFilters getFilters;

  Future getData() async {
    debugPrint('@@ getData');

    var resp = await locator<GetFilters>().call();
    _filterList = resp.$1!;
    notifyListeners();
  }

  addFilters(Taxonomy item) {
    _selected.add(item);
    notifyListeners();
  }

  removeFilter(Taxonomy item) {
    _selected.removeWhere((e) => e.id == item.id);
    notifyListeners();
  }
}

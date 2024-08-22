// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:food_app/core/locator.dart';
import 'package:food_app/domain/entity/filter.dart';
import 'package:food_app/domain/entity/taxonomy.dart';
import 'package:food_app/domain/use_cases/get_filters.dart';

class FilterProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _error = "";
  String get error => _error;

  /// to store list from backend
  List<Filter> _filterList = [];
  List<Filter> get filterList => _filterList;

  /// to store selected filters
  List<Taxonomy> _selected = [];
  List<Taxonomy> get selected => _selected;

  FilterProvider(this.getFilters);
  GetFilters getFilters;

  /// calling api
  Future getData() async {
    _isLoading = true;
    _error = "";
    notifyListeners();
    var resp = await locator<GetFilters>().call();
    _filterList = resp.$1!;
    if (_filterList.isEmpty) {
      _error = resp.$2!.toString();
    }
    _isLoading = false;
    notifyListeners();
  }

  /// for selecting multiple select options
  addMutliSelect(Taxonomy item) {
    _selected.add(item);
    notifyListeners();
  }

  /// for selecting single select options
  addSingleSelect(Taxonomy item) {
    _selected.removeWhere((e) => e.filterId == item.filterId);
    _selected.add(item);
    notifyListeners();
  }

  /// removing selected filter on clicking the list above, or again tapping selected item
  removeFilter(Taxonomy item) {
    _selected.removeWhere((e) => e.slug == item.slug);
    notifyListeners();
  }

  /// to display count of selected filters for a type
  int selectedCount(String id) {
    return selected.where((e) => e.filterId == id).length;
  }
}

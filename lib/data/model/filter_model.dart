import 'package:food_app/data/model/taxonomy_model.dart';
import 'package:food_app/domain/entity/filter.dart';

class FilterModel extends Filter {
  FilterModel({
    super.name,
    super.slug,
    super.taxonomyList,
  });

  factory FilterModel.fromJson(Map<String, dynamic> json) {
    return FilterModel(
      name: json['name'] ?? "",
      slug: json['slug'] ?? "",
      taxonomyList: (json['taxonomies'] as List)
          .map((e) => TaxonomyModel.fromJson(e))
          .toList(),
    );
  }
}

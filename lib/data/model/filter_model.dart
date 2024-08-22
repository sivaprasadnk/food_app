import 'package:food_app/data/model/taxonomy_model.dart';
import 'package:food_app/domain/entity/filter.dart';

class FilterModel extends Filter {
  FilterModel({
    super.name,
    super.slug,
    super.taxonomyList,
  });

  factory FilterModel.fromJson(Map<String, dynamic> json) {
    List list = json['taxonomies'] as List;
    if (!(list.first as Map).containsKey('locations')) {
      return FilterModel(
        name: json['name'] ?? "",
        slug: json['slug'] ?? "",
        taxonomyList: (list)
            .map((e) => TaxonomyModel.fromJson(e, json['slug'] ?? ""))
            .toList(),
      );
    }
    list = (list.first as Map)['locations'];
    return FilterModel(
      name: json['name'] ?? "",
      slug: json['slug'] ?? "",
      taxonomyList: (list)
          .map((e) => TaxonomyModel.fromJson(e, json['slug'] ?? ""))
          .toList(),
    );
  }
}

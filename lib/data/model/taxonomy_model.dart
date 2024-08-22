import 'package:food_app/domain/entity/taxonomy.dart';

class TaxonomyModel extends Taxonomy {
  TaxonomyModel({
    super.id,
    super.guid,
    super.name,
    super.slug,
    super.filterId,
  });

  factory TaxonomyModel.fromJson(Map<String, dynamic> json, String filterId) {
    return TaxonomyModel(
      id: json['id'] ?? 0,
      guid: json['Guid'] ?? "",
      slug: json['slug'] ?? "",
      name: json['name'] ?? "",
      filterId: filterId,
      
    );
  }
}

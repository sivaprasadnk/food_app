import 'package:food_app/domain/entity/taxonomy.dart';

class TaxonomyModel extends Taxonomy {
  TaxonomyModel({
    super.id,
    super.guid,
    super.name,
    super.slug,
  });

  factory TaxonomyModel.fromJson(Map<String, dynamic> json) {
    return TaxonomyModel(
      id: json['id'] ?? 0,
      guid: json['Guid'] ?? "",
      slug: json['slug'] ?? "",
      name: json['name'] ?? "",
    );
  }
}

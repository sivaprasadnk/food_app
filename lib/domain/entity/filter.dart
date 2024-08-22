import 'package:food_app/domain/entity/taxonomy.dart';

class Filter {
  String? name;
  String? slug;
  List<Taxonomy>? taxonomyList;
  Filter({
    this.name,
    this.slug,
    this.taxonomyList,
  });
}

import 'package:food_app/domain/entity/filter.dart';

abstract class Repository {
  Future<(List<Filter>?, Exception?)> getFilterData();
}

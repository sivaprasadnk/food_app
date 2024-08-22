import 'package:food_app/data/data_source/remote_datasource.dart';
import 'package:food_app/data/repository/repository_impl.dart';
import 'package:food_app/domain/use_cases/get_filters.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

GetIt locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(() => RemoteDatasourceImpl(locator()));
  locator.registerLazySingleton(() => RepositoryImpl(locator()));
  locator.registerLazySingleton(() => GetFilters(locator()));
}

import 'package:food_app/data/data_source/remote_datasource.dart';
import 'package:food_app/domain/entity/filter.dart';
import 'package:food_app/domain/repository/repository.dart';

class RepositoryImpl extends Repository {
  RepositoryImpl(this.remoteDataSource);
  final RemoteDatasourceImpl remoteDataSource;

  @override
  Future<(List<Filter>?, Error?)> getFilterData() async {
    try {
      var resp = await remoteDataSource.getFilterData();
      return (resp.$1!, null);
    } catch (err) {
      // print(" error :$err");

      return (null, err as Error);
    }
  }
}

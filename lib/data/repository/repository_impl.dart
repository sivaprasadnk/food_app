import 'package:food_app/data/data_source/remote_datasource.dart';
import 'package:food_app/domain/entity/filter.dart';
import 'package:food_app/domain/repository/repository.dart';

class RepositoryImpl extends Repository {
  RepositoryImpl(this.remoteDataSource);
  final RemoteDatasourceImpl remoteDataSource;

  @override
  Future<(List<Filter>?, Exception?)> getFilterData() async {
    try {
      var resp = await remoteDataSource.getFilterData();
      return (resp.$1!, null);
    } catch (err) {
      return (null, Exception('Error in fetching api'));
    }
  }
}

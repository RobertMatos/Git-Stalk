import 'package:dartz/dartz.dart';

import '../../domain/entities/result_item_entity.dart';
import '../../domain/repositories/search_repository.dart';
import '../dataSources/search_data_sources.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDataSource _searchDataSource;

  SearchRepositoryImpl({required SearchDataSource searchDataSource})
      : _searchDataSource = searchDataSource;
  @override
  Future<Either<Exception, List<ResultItemEntity>>> searchByUser(
      {required String query}) async {
    return await _searchDataSource.searchByUser(query: query);
  }
}

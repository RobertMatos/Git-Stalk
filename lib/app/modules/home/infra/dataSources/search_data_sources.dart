import 'package:dartz/dartz.dart';
import 'package:git_stalk/app/modules/home/infra/models/result_item_model.dart';

abstract class SearchDataSource {
  Future<Either<Exception, List<ResultItemModel>>> searchByUser(
      {required String query});
}
import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/user_case/user_case.dart';
import '../entities/result_item_entity.dart';

class GetUserByQueryUseCase extends UseCase<List<ResultItemEntity>, String> {
  @override
  Future<Either<Failure, List<ResultItemEntity>>> call(String paramas) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

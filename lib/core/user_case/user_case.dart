
import 'package:dartz/dartz.dart';
import 'package:git_stalk/core/error/failure.dart';

abstract class UseCase<T, P> {
  Future<Either<Failure, T>> call(P params);
}

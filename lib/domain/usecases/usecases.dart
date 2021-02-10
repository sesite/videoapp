import 'package:dartz/dartz.dart';
import 'package:move_app/domain/entities/app_error.dart';

abstract class UseCases<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}

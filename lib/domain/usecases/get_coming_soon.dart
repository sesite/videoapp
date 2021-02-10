import 'package:dartz/dartz.dart';
import 'package:move_app/domain/entities/app_error.dart';
import 'package:move_app/domain/entities/movie_entity.dart';
import 'package:move_app/domain/entities/no_params.dart';
import 'package:move_app/domain/repositories/movie_repositories.dart';
import 'package:move_app/domain/usecases/usecases.dart';

class GetComingSoon extends UseCases<List<MovieEntity>, NoParams> {
  final MovieRepository repository;

  GetComingSoon(this.repository);
  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
    return await repository.getComingSoon();
  }
}

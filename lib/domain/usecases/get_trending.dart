import 'package:dartz/dartz.dart';
import 'package:move_app/data/models/movie_model.dart';
import 'package:move_app/domain/entities/app_error.dart';
import 'package:move_app/domain/entities/movie_entity.dart';
import 'package:move_app/domain/repositories/movie_repositories.dart';

class GetTrending {
  final MovieRepository repository;

  GetTrending(this.repository);

  Future<Either<AppError, List<MovieEntity>>> call() async {
    return await repository.getTrending();
  }
}

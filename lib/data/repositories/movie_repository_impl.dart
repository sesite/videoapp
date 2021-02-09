import 'package:move_app/data/data_sources/movie_remote_data_sources.dart';
import 'package:move_app/data/models/movie_model.dart';
import 'package:move_app/domain/entities/movie_entity.dart';
import 'package:move_app/domain/repositories/movie_repositories.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<MovieModel>> getTrending() async {
    try {
      final movies = await remoteDataSource.getTrending();
      return movies;
    } catch (e) {
      return null;
    }
  }
}

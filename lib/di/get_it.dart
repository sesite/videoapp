import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:move_app/data/core/api_client.dart';
import 'package:move_app/data/data_sources/movie_remote_data_sources.dart';
import 'package:move_app/data/repositories/movie_repository_impl.dart';
import 'package:move_app/domain/repositories/movie_repositories.dart';
import 'package:move_app/domain/usecases/get_coming_soon.dart';
import 'package:move_app/domain/usecases/get_playing_now.dart';
import 'package:move_app/domain/usecases/get_popular.dart';
import 'package:move_app/domain/usecases/get_trending.dart';
import 'package:move_app/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';

final getItInstance = GetIt.instance;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));
  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(getItInstance()));
  getItInstance
      .registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));
  getItInstance
      .registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));
  getItInstance.registerLazySingleton<GetPlayingNow>(
      () => GetPlayingNow(getItInstance()));
  getItInstance.registerLazySingleton<GetComingSoon>(
      () => GetComingSoon(getItInstance()));
  getItInstance.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(getItInstance()));

  getItInstance.registerFactory(
    () => MovieCarouselBloc(
      getTrending: getItInstance(),
    ),
  );
}

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:move_app/data/core/api_client.dart';
import 'package:move_app/data/data_sources/movie_remote_data_sources.dart';
import 'package:move_app/data/repositories/movie_repository_impl.dart';
import 'package:move_app/domain/entities/app_error.dart';
import 'package:move_app/domain/entities/movie_entity.dart';
import 'package:move_app/domain/entities/no_params.dart';
import 'package:move_app/domain/repositories/movie_repositories.dart';
import 'package:move_app/domain/usecases/get_trending.dart';
import 'package:move_app/di/get_it.dart' as getIt;
import 'package:pedantic/pedantic.dart';

void main() async {
  getIt.init();
  /*ApiClient apiClient = ApiClient(Client());
  MovieRemoteDataSource dataSource = MovieRemoteDataSourceImpl(apiClient);
  MovieRepository movieRepository = MovieRepositoryImpl(dataSource);*/
  GetTrending getTrending = getIt.getItInstance<GetTrending>();
  final Either<AppError, List<MovieEntity>> eitherResponse =
      await getTrending(NoParams());
  eitherResponse.fold(
    (l) => {
      print('error'),
      print(l),
    },
    (r) => {
      print('list of movie'),
      print(r),
    },
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Container(),
    );
  }
}

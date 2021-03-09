import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:move_app/domain/entities/movie_entity.dart';
import 'package:move_app/domain/entities/no_params.dart';
import 'package:move_app/domain/usecases/get_trending.dart';

part 'movie_carousel_event.dart';
part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;

  MovieCarouselBloc({@required this.getTrending})
      : super(MovieCarouselInitial());

  @override
  Stream<MovieCarouselState> mapEventToState(
    MovieCarouselEvent event,
  ) async* {
    print('MovieCarouselBloc');
    if (event is CarouselLoadEvent) {
      print('event = ' + event.toString());
      final moviesEither = await getTrending(NoParams());
      print('1');
      yield moviesEither.fold(
        (l) {
          print('ddd');
          return MovieCarouseError();
        },
        (movies) {
          print('sss');
          return MovieCarouselLoaded(
            movies: movies,
            defaultIndex: event.defaultIndex,
          );
        },
      );
    }
  }
}

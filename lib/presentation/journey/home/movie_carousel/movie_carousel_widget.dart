import 'package:flutter/material.dart';
import 'package:move_app/domain/entities/movie_entity.dart';
import 'package:move_app/presentation/journey/home/movie_carousel/movie_page_view.dart';
import 'package:move_app/presentation/widgets/movie_app_bar.dart';

class MovieCarouselWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselWidget({
    Key key,
    @required this.movies,
    @required this.defaultIndex,
  })  : assert(defaultIndex >= 0, 'defaultIndex cannot be less than 0'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MovieAppBar(),
        MoviePageView(
          movies: movies,
          initialPage: defaultIndex,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:move_app/common/constants/size_constants.dart';
import 'package:move_app/data/core/api_constants.dart';

class MovieCardWidget extends StatelessWidget {
  final int movieId;
  final String posterPath;

  const MovieCardWidget({
    Key key,
    @required this.movieId,
    @required this.posterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 32.0,
      borderRadius: BorderRadius.circular(Sizes.dimen_16),
      child: GestureDetector(
        onTap: () {},
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.dimen_16),
          child: CachedNetworkImage(
            imageUrl: '${ApiConstants.BASE_IMAGE_URL}$posterPath',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

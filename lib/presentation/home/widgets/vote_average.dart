import 'package:film_catalog/domain/entities/movie_entity.dart';
import 'package:flutter/material.dart';

class VoteAverage extends StatelessWidget {
  const VoteAverage({
    super.key,
    required this.movie,
  });

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.yellow[800],
          size: 14,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow[800],
          size: 14,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow[800],
          size: 14,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow[800],
          size: 14,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow[800],
          size: 14,
        ),
        const SizedBox(width: 5),
        Text(
          movie.voteAverage ?? "",
          //style: IText.labelStyle.copyWith(fontSize: 11),
        ),
      ],
    );
  }
}

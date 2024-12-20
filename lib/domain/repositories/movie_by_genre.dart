import 'package:film_catalog/domain/entities/movie_entity.dart';

abstract class MovieByGenreRepository {
  Future<List<MovieEntity>> getMovieByGenre(int movieId);
}

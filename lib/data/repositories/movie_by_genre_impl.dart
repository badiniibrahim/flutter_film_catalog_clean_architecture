import 'package:film_catalog/data/models/movie.dart';
import 'package:film_catalog/data/providers/network/apis/movie_by_genre.dart';
import 'package:film_catalog/domain/entities/movie_entity.dart';
import 'package:film_catalog/domain/repositories/movie_by_genre.dart';

class MovieByGenreImpl extends MovieByGenreRepository {
  @override
  Future<List<MovieEntity>> getMovieByGenre(int movieId) async {
    final response = await MovieByGenreApi(movieId: movieId).request();
    var movies = response['results'] as List;
    List<MovieEntity> movieList =
        movies.map((m) => MovieModel.fromJson(m).toEntity()).toList();
    return movieList;
  }
}

import 'package:film_catalog/core/usecase/param_usecase.dart';
import 'package:film_catalog/domain/entities/movie_entity.dart';
import 'package:film_catalog/domain/repositories/movie_by_genre.dart';

class MovieByGenreUsecase extends ParamUseCase<List<MovieEntity>, int> {
  final MovieByGenreRepository _movieByGenreRepository;
  MovieByGenreUsecase(this._movieByGenreRepository);

  @override
  Future<List<MovieEntity>> execute(param) {
    return _movieByGenreRepository.getMovieByGenre(param);
  }
}

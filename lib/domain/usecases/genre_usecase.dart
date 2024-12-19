import 'package:film_catalog/core/usecase/no_param_use_case.dart';
import 'package:film_catalog/domain/entities/genre_entity.dart';
import 'package:film_catalog/domain/repositories/genre_repository.dart';

class GenreUseCase extends NoParamUseCase {
  final GenreRepository _genreRepository;
  GenreUseCase(this._genreRepository);

  @override
  Future<List<GenreEntity>> execute() {
    return _genreRepository.getGenreList();
  }
}

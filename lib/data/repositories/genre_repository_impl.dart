import 'package:film_catalog/data/models/genre_model.dart';
import 'package:film_catalog/data/providers/network/apis/genre_api.dart';
import 'package:film_catalog/domain/entities/genre_entity.dart';
import 'package:film_catalog/domain/repositories/genre_repository.dart';

class GenreRepositoryImpl extends GenreRepository {
  @override
  Future<List<GenreEntity>> getGenreList() async {
    final response = await GenreApi().request();
    var genres = response['genres'] as List;
    List<GenreEntity> genreList =
        genres.map((m) => GenreModel.fromJson(m).toEntity()).toList();
    return genreList;
  }
}

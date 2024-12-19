import 'package:film_catalog/domain/entities/genre_entity.dart';

abstract class GenreRepository {
  Future<List<GenreEntity>> getGenreList();
}

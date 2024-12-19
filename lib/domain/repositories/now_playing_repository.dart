import 'package:film_catalog/domain/entities/movie_entity.dart';

abstract class NowPlayingRepository {
  Future<List<MovieEntity>> getNowPlayingMovie();
}

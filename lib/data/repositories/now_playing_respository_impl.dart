import 'package:film_catalog/data/models/movie.dart';
import 'package:film_catalog/data/providers/network/apis/now_playing_api.dart';
import 'package:film_catalog/domain/entities/movie_entity.dart';
import 'package:film_catalog/domain/repositories/now_playing_repository.dart';

class NowPlayingRepositoryImpl extends NowPlayingRepository {
  @override
  Future<List<MovieEntity>> getNowPlayingMovie() async {
    final response = await NowPlayingApi().request();
    var movies = response['results'] as List;
    List<MovieEntity> movieList =
        movies.map((m) => MovieModel.fromJson(m).toEntity()).toList();
    return movieList;
  }
}

import 'package:film_catalog/core/usecase/no_param_use_case.dart';
import 'package:film_catalog/domain/entities/movie_entity.dart';
import 'package:film_catalog/domain/repositories/now_playing_repository.dart';

class PlayNowUsecase extends NoParamUseCase {
  final NowPlayingRepository _nowPlayingRepository;
  PlayNowUsecase(this._nowPlayingRepository);

  @override
  Future<List<MovieEntity>> execute() {
    return _nowPlayingRepository.getNowPlayingMovie();
  }
}

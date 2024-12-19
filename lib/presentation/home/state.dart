import 'package:film_catalog/domain/entities/genre_entity.dart';
import 'package:film_catalog/domain/entities/movie_entity.dart';
import 'package:get/get.dart';

class HomeState {
  final RxBool _isLoading = RxBool(false);
  set isLoading(value) => _isLoading.value = value;
  bool get isLoading => _isLoading.value;

  final RxList<GenreEntity> _genreList = <GenreEntity>[].obs;
  set genreList(value) => _genreList.value = value;
  List<GenreEntity> get genreList => _genreList;

  final RxList<MovieEntity> _nowPlayingMovieList = <MovieEntity>[].obs;
  set nowPlayingMovieList(value) => _nowPlayingMovieList.value = value;
  List<MovieEntity> get nowPlayingMovieList => _nowPlayingMovieList;

  final RxInt _selectedGenre = RxInt(28);
  set selectedGenre(value) => _selectedGenre.value = value;
  int get selectedGenre => _selectedGenre.value;
}

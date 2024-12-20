import 'package:film_catalog/domain/usecases/genre_usecase.dart';
import 'package:film_catalog/domain/usecases/movie_by_genre_usecase.dart';
import 'package:film_catalog/domain/usecases/play_now_usecase.dart';
import 'package:film_catalog/presentation/home/state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final PlayNowUsecase _playNowUsecase;
  final GenreUseCase _genreUseCase;
  final MovieByGenreUsecase genreUsecase;

  final HomeState state = HomeState();
  late PageController pageController;

  var pageOffSet = 1.obs;
  var currentIndex = 1.obs;

  HomeController(this._playNowUsecase, this._genreUseCase, this.genreUsecase);

  Future<void> getGenreList() async {
    var response = await _genreUseCase.execute();
    state.genreList = response;
  }

  Future<void> getNowPlayingMovie() async {
    var response = await _playNowUsecase.execute();
    state.nowPlayingMovieList = response;
  }

  void updateIndex(int value) {
    currentIndex.value = value % state.nowPlayingMovieList.length;
  }

  void setSelectedGenre(int id) {
    state.selectedGenre = id;
  }

  Future<void> getMovieByGenre(int movieId) async {
    state.isLoading = true;
    try {
      if (movieId == 0) {
        final response = await _playNowUsecase.execute();
        state.nowPlayingMovieList = response;
      } else {
        final response = await genreUsecase.execute(movieId);
        state.nowPlayingMovieList = response;
      }
    } catch (e) {
      debugPrint("getMovieByGenre : $e");
    } finally {
      state.isLoading = false;
    }
  }

  @override
  void onInit() {
    pageController = PageController();
    getGenreList();
    getNowPlayingMovie();
    super.onInit();
  }
}

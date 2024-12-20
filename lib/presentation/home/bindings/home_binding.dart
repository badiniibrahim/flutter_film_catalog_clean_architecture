import 'package:film_catalog/data/repositories/genre_repository_impl.dart';
import 'package:film_catalog/data/repositories/movie_by_genre_impl.dart';
import 'package:film_catalog/data/repositories/now_playing_respository_impl.dart';
import 'package:film_catalog/domain/usecases/genre_usecase.dart';
import 'package:film_catalog/domain/usecases/movie_by_genre_usecase.dart';
import 'package:film_catalog/domain/usecases/play_now_usecase.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlayNowUsecase(Get.put(NowPlayingRepositoryImpl())));
    Get.lazyPut(() => GenreUseCase(Get.put(GenreRepositoryImpl())));
    Get.lazyPut(() => MovieByGenreUsecase(Get.put(MovieByGenreImpl())));

    Get.lazyPut<HomeController>(
      () => HomeController(
        Get.find(),
        Get.find(),
        Get.find(),
      ),
    );
  }
}

import 'package:film_catalog/domain/usecases/genre_usecase.dart';
import 'package:film_catalog/domain/usecases/movie_by_genre_usecase.dart';
import 'package:film_catalog/domain/usecases/play_now_usecase.dart';
import 'package:film_catalog/initializer.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        getIt<PlayNowUsecase>(),
        getIt<GenreUseCase>(),
        getIt<MovieByGenreUsecase>(),
      ),
    );
  }
}

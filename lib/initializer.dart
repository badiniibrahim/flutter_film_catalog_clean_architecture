import 'package:film_catalog/core/config/environment.dart';
import 'package:film_catalog/data/repositories/genre_repository_impl.dart';
import 'package:film_catalog/data/repositories/movie_by_genre_impl.dart';
import 'package:film_catalog/data/repositories/now_playing_respository_impl.dart';
import 'package:film_catalog/domain/usecases/genre_usecase.dart';
import 'package:film_catalog/domain/usecases/movie_by_genre_usecase.dart';
import 'package:film_catalog/domain/usecases/play_now_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class Initializer {
  static Future<void> init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();

      await _initEnvironment();
      await _setupLocator();
    } catch (err) {
      rethrow;
    }
  }

  static Future<void> _initEnvironment() async {
    await dotenv.load(fileName: Environment.fileName);
  }

  static Future<void> _setupLocator() async {
    // Repositories
    getIt.registerLazySingleton<NowPlayingRepositoryImpl>(
        () => NowPlayingRepositoryImpl());
    getIt.registerLazySingleton<GenreRepositoryImpl>(
        () => GenreRepositoryImpl());
    getIt.registerLazySingleton<MovieByGenreImpl>(() => MovieByGenreImpl());

    // Use Cases
    getIt.registerLazySingleton<PlayNowUsecase>(
        () => PlayNowUsecase(getIt<NowPlayingRepositoryImpl>()));
    getIt.registerLazySingleton<GenreUseCase>(
        () => GenreUseCase(getIt<GenreRepositoryImpl>()));
    getIt.registerLazySingleton<MovieByGenreUsecase>(
        () => MovieByGenreUsecase(getIt<MovieByGenreImpl>()));
  }
}

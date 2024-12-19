import 'package:film_catalog/domain/entities/movie_entity.dart';
import 'package:film_catalog/presentation/home/widgets/movie_info.dart';
import 'package:film_catalog/utils/colors.style.dart';
import 'package:flutter/material.dart';

class MovieDetailPage extends StatelessWidget {
  final MovieEntity movie;
  const MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        forceMaterialTransparency: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Movie Detail",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              SizedBox(
                height: 335,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Hero(
                      tag: movie.backdropPath ?? "",
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.network(
                            height: 300,
                            width: 205,
                            fit: BoxFit.cover,
                            "https://image.tmdb.org/t/p/original/${movie.backdropPath}"),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MovieInfo(
                          icon: Icons.work_rounded,
                          name: "Language",
                          value: movie.originalLanguage ?? "",
                        ),
                        MovieInfo(
                            icon: Icons.calendar_month,
                            name: "Release Date",
                            value: movie.releaseDate ?? ""),
                        MovieInfo(
                          icon: Icons.star,
                          name: "Average",
                          value: movie.voteAverage ?? "",
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                movie.title ?? "",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Divider(
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
              const Text(
                "Synopsis",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                movie.overview ?? "",
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.white60,
                  height: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

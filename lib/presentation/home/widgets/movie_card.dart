import 'package:film_catalog/domain/entities/movie_entity.dart';
import 'package:film_catalog/presentation/home/widgets/vote_average.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final MovieEntity movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Hero(
        tag: movie.backdropPath ?? "",
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        "https://image.tmdb.org/t/p/original/${movie.backdropPath}",
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      movie.title ?? "Unknown Title",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'muli',
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_view_week_sharp,
                          color: Colors.blue[300],
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            movie.releaseDate ?? "N/A",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'muli',
                              color: Colors.blue[300],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Flexible(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Vote Count : ",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'muli',
                                    color: Colors.black.withOpacity(0.4),
                                  ),
                                ),
                                TextSpan(
                                  text: "${movie.voteCount}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'muli',
                                    color: Colors.black.withOpacity(0.8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue.shade50,
                          ),
                          child: const Icon(
                            Icons.video_call_outlined,
                            color: Colors.blue,
                            size: 23,
                          ),
                        ),
                      ],
                    ),
                    VoteAverage(movie: movie),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

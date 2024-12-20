import 'package:film_catalog/domain/entities/genre_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class GenreWidget extends StatelessWidget {
  const GenreWidget({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 40,
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const VerticalDivider(
              color: Colors.transparent,
              width: 5,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: controller.state.genreList.length,
            itemBuilder: (context, index) {
              GenreEntity genre = controller.state.genreList[index];

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      GenreEntity genre = controller.state.genreList[index];
                      controller.setSelectedGenre(genre.id ?? 28);
                      controller.getMovieByGenre(genre.id ?? 28);
                    },
                    child: Obx(
                      () => Container(
                        padding: const EdgeInsets.all(9),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25),
                          ),
                          color: (genre.id == controller.state.selectedGenre)
                              ? Colors.yellow[800]
                              : Colors.white,
                        ),
                        child: Text(
                          genre.name?.toUpperCase() ?? "",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: (genre.id == controller.state.selectedGenre)
                                ? Colors.white
                                : Colors.black45,
                            fontFamily: 'muli',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }
}

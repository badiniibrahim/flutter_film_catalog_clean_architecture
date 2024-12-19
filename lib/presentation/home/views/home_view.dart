import 'dart:math';

import 'package:film_catalog/presentation/home/widgets/app_title.dart';
import 'package:film_catalog/presentation/home/widgets/detail_page.dart';
import 'package:film_catalog/presentation/home/widgets/genre_widget.dart';
import 'package:film_catalog/utils/colors.style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(Get.find(), Get.find()),
      initState: (_) {},
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: AppBar(
            centerTitle: false,
            backgroundColor: AppColors.backgroundColor,
            title: const AppTitle(),
          ),
          body: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Category",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GenreWidget(controller: controller),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Playing now",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Expanded(
                      child: Obx(() {
                        if (controller.state.nowPlayingMovieList.isEmpty) {
                          return const Center(
                            child: Text(
                              "No movies available",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          );
                        }

                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            PageView.builder(
                              controller: controller.pageController,
                              onPageChanged: (index) {
                                controller.updateIndex(index);
                              },
                              itemCount:
                                  controller.state.nowPlayingMovieList.length,
                              itemBuilder: (context, index) {
                                double scale = max(
                                  0.6,
                                  (1 -
                                      (controller.pageOffSet - index).abs() +
                                      0.6),
                                );
                                double angle = (controller.pageController
                                            .position.haveDimensions
                                        ? index.toDouble() -
                                            (controller.pageController.page ??
                                                0)
                                        : index.toDouble() - 1) *
                                    5;
                                angle = angle.clamp(-5, 5);

                                final movie =
                                    controller.state.nowPlayingMovieList[index];

                                return GestureDetector(
                                  onTap: () {
                                    Get.to(() => MovieDetailPage(
                                          movie: movie,
                                        ));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: 100 - (scale / 1.6 * 100),
                                    ),
                                    child: Stack(
                                      alignment: Alignment.topCenter,
                                      children: [
                                        Transform.rotate(
                                          angle: angle * pi / 90,
                                          child: Hero(
                                            tag: movie.backdropPath ?? "",
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              child: Image.network(
                                                "https://image.tmdb.org/t/p/original/${movie.backdropPath}",
                                                height: 300,
                                                width: 205,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 210,
                                          child: SizedBox(
                                              width: 300,
                                              child: Text(
                                                textAlign: TextAlign.center,
                                                movie.title?.toUpperCase() ??
                                                    "",
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'muli',
                                                ),
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            /* Positioned(
                              top: 330,
                              child: Row(
                                children: List.generate(
                                  controller.state.nowPlayingMovieList.length,
                                  (index) => AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    margin: const EdgeInsets.only(right: 15),
                                    width:
                                        controller.currentIndex.value == index
                                            ? 30
                                            : 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color:
                                          controller.currentIndex.value == index
                                              ? Colors.amber
                                              : Colors.white24,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                            )*/
                          ],
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

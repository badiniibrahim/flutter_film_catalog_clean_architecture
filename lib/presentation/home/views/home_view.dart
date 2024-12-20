import 'package:film_catalog/presentation/home/widgets/app_title.dart';
import 'package:film_catalog/presentation/home/widgets/detail_page.dart';
import 'package:film_catalog/presentation/home/widgets/genre_widget.dart';
import 'package:film_catalog/utils/colors.style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(Get.find(), Get.find()),
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
                            fontFamily: 'muli',
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
                          fontFamily: 'muli',
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        child: Obx(
                          () => Swiper(
                            itemHeight:
                                MediaQuery.of(context).size.height * 0.65,
                            itemCount:
                                controller.state.nowPlayingMovieList.length,
                            layout: SwiperLayout.STACK,
                            itemWidth: MediaQuery.of(context).size.width * 0.7,
                            axisDirection: AxisDirection.right,
                            onTap: (index) {
                              Get.to(
                                () => MovieDetailPage(
                                  movie: controller
                                      .state.nowPlayingMovieList[index],
                                ),
                              );
                            },
                            loop: true,
                            itemBuilder: (context, index) {
                              final movie =
                                  controller.state.nowPlayingMovieList[index];

                              return ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Hero(
                                  tag: movie.backdropPath ?? "",
                                  child: Container(
                                    color: Colors.white,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(height: 10),
                                              Text(
                                                movie.title!,
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'muli',
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on_outlined,
                                                    color: Colors.blue[300],
                                                    size: 14,
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      "travel.location!",
                                                      overflow:
                                                          TextOverflow.ellipsis,
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
                                                            text:
                                                                "\$${"travel.price"} /",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'muli',
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.4),
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text: "Person",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'muli',
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.8),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color:
                                                          Colors.blue.shade50,
                                                    ),
                                                    child: const Icon(
                                                      Icons.video_call_outlined,
                                                      color: Colors.blue,
                                                      size: 23,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
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

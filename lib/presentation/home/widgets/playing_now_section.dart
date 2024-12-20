import 'package:film_catalog/presentation/home/controllers/home_controller.dart';
import 'package:film_catalog/presentation/home/widgets/detail_page.dart';
import 'package:film_catalog/presentation/home/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';

class PlayingNowSection extends StatelessWidget {
  final HomeController controller;

  const PlayingNowSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
            child: Obx(
              () => Swiper(
                itemHeight: MediaQuery.of(context).size.height * 0.65,
                itemCount: controller.state.nowPlayingMovieList.length,
                layout: SwiperLayout.STACK,
                itemWidth: MediaQuery.of(context).size.width * 0.7,
                axisDirection: AxisDirection.right,
                onTap: (index) {
                  Get.to(() => MovieDetailPage(
                        movie: controller.state.nowPlayingMovieList[index],
                      ));
                },
                loop: true,
                itemBuilder: (context, index) {
                  final movie = controller.state.nowPlayingMovieList[index];
                  return MovieCard(movie: movie);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

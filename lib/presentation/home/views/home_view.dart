import 'package:film_catalog/presentation/home/controllers/home_controller.dart';
import 'package:film_catalog/presentation/home/widgets/app_title.dart';
import 'package:film_catalog/presentation/home/widgets/category_section.dart';
import 'package:film_catalog/utils/colors.style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/playing_now_section.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppColors.backgroundColor,
        title: const AppTitle(),
      ),
      body: Column(
        children: [
          CategorySection(controller: controller),
          const SizedBox(height: 10),
          PlayingNowSection(controller: controller),
        ],
      ),
    );
  }
}

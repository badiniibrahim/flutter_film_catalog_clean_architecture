import 'package:film_catalog/presentation/home/controllers/home_controller.dart';
import 'package:film_catalog/presentation/home/widgets/genre_widget.dart';
import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  final HomeController controller;

  const CategorySection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
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
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GenreWidget(controller: controller),
        ),
      ],
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_colors.dart';
import 'package:portfolio/widgets/custom_card_widget.dart';
import 'package:portfolio/widgets/inactive_custom_card_widget.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({super.key});

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: _items.length,
          carouselController: _controller,
          options: CarouselOptions(
            height: 250,
            viewportFraction: 0.45,
            enlargeCenterPage: false,
            enableInfiniteScroll: true,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            final item = _items[index];
            final isActive = index == _currentIndex;
            if (isActive) {
              return CustomCardWidget(
                imagePath: item["image"]!,
                title: item["title"]!,
                subtitle: item["subtitle"]!,
              );
            } else {
              return AnimatedOpacity(
                opacity: 0.5,
                duration: Duration(milliseconds: 600),
                child: InactiveCustomCardWidget(
                  imagePath: item["image"]!,
                  title: item["title"]!,
                  subtitle: item["subtitle"]!,
                ),
              );
            }
          },
        ),
        Positioned(
          left: 0,
          child: Container(
            width: 350,
            height: 250,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.black.withValues(
                    alpha: 0.6,
                  ), // black at top with opacity
                  AppColors.black.withValues(
                    alpha: 0.3,
                  ), // softer black in middle
                  Colors.transparent, // fade to fully transparent
                ],
              ),
            ),
          ),
        ),

        Positioned(
          right: 0,
          child: Container(
            width: 350,
            height: 250,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.black.withValues(
                    alpha: 0.6,
                  ), // black at top with opacity
                  AppColors.black.withValues(
                    alpha: 0.3,
                  ), // softer black in middle
                  Colors.transparent, // fade to fully transparent
                ],
              ),
            ),
          ),
        ),
        //--------- previous button -------------
        Positioned(
          left: 10,
          top: 55,
          child: GestureDetector(
            onTap: () => _controller.previousPage(),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.white, width: 1),
                color: AppColors.black.withValues(alpha: 0.7),
              ),
              child: Center(
                child: const Icon(
                  Icons.arrow_back_rounded,
                  size: 35,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),

        //-----------Next Button ------------
        Positioned(
          right: 10,
          top: 55,
          child: GestureDetector(
            onTap: () => _controller.nextPage(),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.white, width: 1),
                color: AppColors.black.withValues(alpha: 0.7),
              ),
              child: Center(
                child: const Icon(
                  Icons.arrow_forward,
                  size: 35,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

final List<Map<String, String>> _items = [
  {
    "image": "assets/images/380708566-06a0fe61-d397-478f-ab98-94248b750d1f.jpg",
    "title": "The simplest example\nis kafka + golang",
    "subtitle":
        "This article presents a simple way to implement a micro-service architecture using Kafka, Golang and Docker.",
  },
  {
    "image": "assets/images/380708566-06a0fe61-d397-478f-ab98-94248b750d1f.jpg",
    "title": "Another cool project",
    "subtitle":
        "This card could describe another project with similar styling.This card could describe another project with similar styling.",
  },
  {
    "image": "assets/images/380708566-06a0fe61-d397-478f-ab98-94248b750d1f.jpg",
    "title": "Your third showcase",
    "subtitle":
        "And here’s a third example with the same layout design.This card could describe another project with similar styling.",
  },
];

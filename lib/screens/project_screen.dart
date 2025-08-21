import 'package:flutter/material.dart';
import 'package:portfolio/widgets/carousel_slider_widget.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 0, vertical: 30),
      child: CarouselSliderWidget(),
    );
  }
}

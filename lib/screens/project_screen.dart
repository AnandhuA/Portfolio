import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ProjectScreen extends StatefulWidget {
  final bool scroll;
  final List<String> projectImages;

  const ProjectScreen({
    super.key,
    required this.scroll,
    required this.projectImages,
  });

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight,
      child: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        physics: widget.scroll
            ? const PageScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        itemCount: widget.projectImages.length,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double value = 1.0;

              if (_pageController.position.haveDimensions) {
                value = _pageController.page! - index;
                value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
              }

              return Transform.scale(
                scale: value, // zoom effect
                child: Opacity(
                  opacity: value, // fade effect
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.projectImages[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

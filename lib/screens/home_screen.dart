import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/widgets/video_background.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          // ---------- Background Video ----------
          const IgnorePointer(child: SizedBox.expand(child: VideoBackground())),

          ScrollTransformView(
            children: [
              //-------- image ---------
              ScrollTransformItem(
                builder: (scrollOffset) {
                  final offScreenPercentage = min(
                    scrollOffset / screenHeight,
                    1.0,
                  );
                  return SizedBox(
                    height:
                        screenHeight -
                        (screenHeight * 0.2 * offScreenPercentage),
                    width:
                        screenWidth -
                        (screenHeight * 0.5 * offScreenPercentage),
                    child: Image.asset(
                      "assets/images/ford_mustang.jpg",
                      fit: BoxFit.cover,
                    ),
                  );
                },
                offsetBuilder: (scrollOffset) {
                  final offScreenPercentage = min(
                    scrollOffset / screenHeight,
                    1.0,
                  );
                  final heightShrinkageAmount =
                      screenHeight * 0.2 * offScreenPercentage;
                  final bool startMovingImage =
                      scrollOffset >= screenHeight * 0.8;
                  final double onScreenOffset =
                      scrollOffset + heightShrinkageAmount / 2;
                  return Offset(
                    0,
                    !startMovingImage
                        ? onScreenOffset
                        : onScreenOffset - (scrollOffset - screenHeight * 0.8),
                  );
                },
              ),
              //---------- Text ------------
              ScrollTransformItem(
                builder: (scrollOffset) {
                  return SizedBox(
                    height: screenHeight,
                    width: screenWidth,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(150),
                        child: Text(
                          "Flutter makes it easy to create smooth animations and delightful user experiences. With just a few lines of code,",
                          style: TextStyle(
                            fontSize: 100,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                offsetBuilder: (scrollOffset) => Offset(0, -screenHeight),
              ),

              //----------- container ---------
              ScrollTransformItem(
                builder: (scrollOffset) {
                  return Container(height: screenHeight, color: Colors.amber);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

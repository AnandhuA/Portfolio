import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_colors.dart';
import 'package:portfolio/widgets/custom_button.dart';

class CustomCardWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  const CustomCardWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Stack(
        children: [
          Container(
            width: 550,
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            width: 400,
            child: Container(
              padding: EdgeInsets.only(left: 30),
              color: AppColors.mediumGray.withValues(alpha: 0.8),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: AppColors.white,
                      fontFamily: "FiraCode",
                    ),
                  ),

                  Text(subtitle, style: TextStyle(color: AppColors.white)),

                  Row(
                    children: [
                      CustomButton(
                        onTap: () {},
                        title: "Read more",
                        height: 50,
                        width: 200,
                        fontSize: 14,
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: AppColors.white,
                          child: Icon(
                            Icons.arrow_forward,
                            color: AppColors.mediumGray,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

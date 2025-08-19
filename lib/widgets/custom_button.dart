import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final double width;
  final double height;
  final Color backgroundColor;
  const CustomButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.height,
    required this.width,
    this.backgroundColor = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        minimumSize: Size(width, height),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(30),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(color: AppColors.black, fontStyle: FontStyle.italic),
      ),
    );
  }
}

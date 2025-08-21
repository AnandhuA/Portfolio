import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_colors.dart';
import 'package:portfolio/widgets/hover.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String iconPath;
  const CustomIconButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      builder: (isHovered) {
        return AnimatedContainer(
          duration: const Duration(seconds: 5),
          curve: Curves.fastLinearToSlowEaseIn,
          decoration: BoxDecoration(
            color: isHovered ? AppColors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppColors.mediumGray),
          ),
          child: TextButton.icon(
            onPressed: onTap,
            label: Padding(
              padding: EdgeInsetsGeometry.only(top: 10, right: 10, bottom: 10),
              child: Text(
                title,
                style: TextStyle(
                  color: isHovered ? AppColors.black : AppColors.gray,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            icon: Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
              child: SizedBox(
                width: 20,
                height: 20,
                child: Image.asset(
                  iconPath,
                  color: isHovered ? AppColors.black : AppColors.white,
                ),
              ),
            ),

            style: TextButton.styleFrom(
              minimumSize: Size(85, 55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(color: AppColors.mediumGray),
              ),
              backgroundColor: isHovered ? AppColors.white : null,
            ),
          ),
        );
      },
    );
  }
}

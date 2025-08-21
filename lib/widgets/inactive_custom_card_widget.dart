import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_colors.dart';
import 'package:portfolio/widgets/custom_button.dart';

class InactiveCustomCardWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  const InactiveCustomCardWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 550,
      height: 250,
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.white),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          Text(
            title,
            maxLines: 1,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: AppColors.white,
              fontFamily: "FiraCode",
            ),
          ),
          Text(subtitle, maxLines: 2, style: TextStyle(color: AppColors.white)),
          Spacer(),
          Row(
            children: [
              CustomButton(
                onTap: () {},
                title: "Read more",
                height: 50,
                width: 200,
                fontSize: 14,
                backgroundColor: AppColors.black,
                textColor: AppColors.white,
              ),
              SizedBox(width: 10),
              GestureDetector(
                child: CircleAvatar(
                  radius: 23,
                  backgroundColor: AppColors.white,
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: AppColors.black,

                    child: Icon(Icons.arrow_forward, color: AppColors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

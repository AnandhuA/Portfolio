import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_colors.dart';
import 'package:portfolio/widgets/custom_button.dart';
import 'package:portfolio/widgets/custom_icon_button.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //---------- title --------------
        Row(
          children: [
            Text(
              "Flutter",
              style: TextStyle(
                fontSize: 100,
                fontFamily: "FiraCode",
                fontWeight: FontWeight.w500,
                color: AppColors.white,
              ),
            ),
            Spacer(),
            CustomButton(
              onTap: () {},
              title: "Projects",
              width: 200,
              height: 55,
            ),
            SizedBox(width: 10),
            CircleAvatar(
              radius: 25,
              backgroundColor: AppColors.white,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward, color: AppColors.mediumGray),
              ),
            ),
          ],
        ),
        Row(
          children: [
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 22,
                  color: AppColors.mediumGray,
                ),
                children: [
                  const TextSpan(text: "My goal is to "),
                  TextSpan(
                    text: "write maintainable, clean",
                    style: const TextStyle(
                      color: AppColors.gray,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const TextSpan(text: "\nand "),
                  TextSpan(
                    text: "understandable code",
                    style: const TextStyle(
                      color: AppColors.gray,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const TextSpan(
                    text: " to process\ndevelopment was enjoyable",
                  ),
                ],
              ),
            ),
            Spacer(),
            Text(
              "Developer",
              style: TextStyle(
                fontSize: 100,
                fontFamily: "FiraCode",
                fontWeight: FontWeight.w500,
                color: AppColors.white,
              ),
            ),
          ],
        ),

        SizedBox(height: 20),
        //---------------------------------
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: Row(
            spacing: 60,
            children: [
              CustomIconButton(
                onTap: () {
                  openLink('https://github.com/AnandhuA');
                },
                title: "GitHub",
                iconPath: "assets/icons/github_icon.png",
              ),
              CustomIconButton(
                onTap: () {},
                title: "LinkedIn",
                iconPath: "assets/icons/linkedin_icon.png",
              ),
              Spacer(),
              CustomIconButton(
                onTap: () {},
                title: "Gmail",
                iconPath: "assets/icons/email_icon.png",
              ),
              Spacer(),
              CustomIconButton(
                onTap: () {},
                title: "Instagram",
                iconPath: "assets/icons/insta_icon.png",
              ),
              CustomIconButton(
                onTap: () {},
                title: "Facebook",
                iconPath: "assets/icons/facebook_icon.png",
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Future<void> openLink(String url) async {
  final uri = Uri.parse(url);
  if (!await launchUrl(uri, webOnlyWindowName: '_blank')) {
    throw Exception('Could not launch $url');
  }
}

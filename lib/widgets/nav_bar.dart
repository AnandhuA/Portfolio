import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_colors.dart';

class NavBar extends StatelessWidget {
  final void Function(String route)? onItemSelected;
  final String activeRoute;

  const NavBar({super.key, this.onItemSelected, required this.activeRoute});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,

        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.gray.withValues(alpha: 0.3),
            spreadRadius: 0.5,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: 50),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _NavItem(
            title: 'Home',
            route: 'home',
            currentRoute: activeRoute,
            onTap: onItemSelected,
          ),
          _NavItem(
            title: 'Project',
            route: 'project',
            currentRoute: activeRoute,
            onTap: onItemSelected,
          ),
          _NavItem(
            title: 'Contact',
            route: 'contact',
            currentRoute: activeRoute,
            onTap: onItemSelected,
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String title;
  final String route;
  final String currentRoute;
  final void Function(String route)? onTap;

  const _NavItem({
    required this.title,
    required this.route,
    required this.currentRoute,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = route == currentRoute;

    return GestureDetector(
      onTap: () => onTap?.call(route),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: isActive ? AppColors.white : AppColors.gray,
                fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
              ),
              child: Text(title),
            ),
            const SizedBox(height: 4),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 2,
              width: isActive ? 30 : 0,
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

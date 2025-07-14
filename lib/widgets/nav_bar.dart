import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_spacing.dart';

class NavBar extends StatelessWidget {
  final void Function(String route)? onItemSelected;
  final String activeRoute;

  const NavBar({super.key, this.onItemSelected, required this.activeRoute});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Row(
        children: [
          // Logo
          Text(
            'Anandhu',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: AppSpacing.font3xl,
              color: Colors.black,
            ),
          ),
          AppSpacing.wBox16,
          // Nav Items
          Row(
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
                color: isActive ? Colors.blue : Colors.black87,
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
                color: Colors.blue,
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

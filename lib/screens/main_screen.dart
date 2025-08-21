import 'package:flutter/material.dart';
import 'package:portfolio/screens/contact_screen.dart';
import 'package:portfolio/screens/home_screen.dart';
import 'package:portfolio/screens/project_screen.dart';
import 'package:portfolio/widgets/nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey homeKey = GlobalKey();
  final GlobalKey projectKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  final ScrollController _scrollController = ScrollController();

  String _currentSection = 'home';

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // final homePos = _getOffset(homeKey);
    final projectPos = _getOffset(projectKey);
    final contactPos = _getOffset(contactKey);
    final scrollOffset = _scrollController.offset;

    const double threshold = -200;

    String newSection = _currentSection;

    if (scrollOffset >= contactPos - threshold) {
      newSection = 'contact';
    } else if (scrollOffset >= projectPos - threshold) {
      newSection = 'project';
    } else {
      newSection = 'home';
    }

    if (newSection != _currentSection) {
      setState(() {
        _currentSection = newSection;
      });
    }
  }

  double _getOffset(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx == null) return 0;
    final box = ctx.findRenderObject() as RenderBox;
    return box
        .localToGlobal(Offset.zero, ancestor: context.findRenderObject())
        .dy;
  }

  void scrollToSection(String section) {
    final key = _getKeyForSection(section);
    final ctx = key?.currentContext;

    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  GlobalKey? _getKeyForSection(String section) {
    switch (section) {
      case 'home':
        return homeKey;
      case 'project':
        return projectKey;
      case 'contact':
        return contactKey;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          NavBar(
            activeRoute: _currentSection,
            onItemSelected: (route) {
              scrollToSection(route);
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: Column(
                  spacing: 20,
                  children: [
                    HomeScreen(key: homeKey),
                    ProjectScreen(key: projectKey),
                    ContactScreen(key: contactKey),
                    Container(height: 100),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

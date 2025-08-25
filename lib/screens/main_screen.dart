import 'package:flutter/material.dart';
import 'package:portfolio/screens/contact_screen.dart';
import 'package:portfolio/screens/home_screen.dart';
import 'package:portfolio/screens/project_screen.dart';
import 'package:portfolio/widgets/nav_bar.dart';
import 'package:portfolio/widgets/video_background.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ScrollController _scroll = ScrollController();
  final PageController _pageController = PageController();

  // Anchors for ensureVisible
  final homeKey = GlobalKey();
  final projectKey = GlobalKey();
  final contactKey = GlobalKey();
  final spaceKey = GlobalKey();

  String _current = 'home';
  bool _projectScroll = false;

  @override
  void initState() {
    super.initState();
    _scroll.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scroll.removeListener(_onScroll);
    _scroll.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final projectPos = _globalDyOf(projectKey);
    final contactPos = _globalDyOf(contactKey);
    final spacePos = _globalDyOf(spaceKey);

    String next = _current;
    if (contactPos <= 100) {
      next = 'contact';
      if (!_projectScroll) {
        setState(() {
          _projectScroll = false;
        });
      }
    } else if (projectPos <= 100) {
      next = 'project';
      if (!_projectScroll) {
        setState(() {
          _projectScroll = true;
        });
      }
    } else if (spacePos <= 100) {
      next = 'space';
      if (_projectScroll) {
        setState(() {
          _projectScroll = false;
        });
      }
    } else {
      next = 'home';
      if (_projectScroll) {
        setState(() {
          _projectScroll = false;
        });
      }
    }
    if (next != _current) setState(() => _current = next);
  }

  double _globalDyOf(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx == null) return double.infinity;
    final box = ctx.findRenderObject() as RenderBox?;
    if (box == null || !box.attached) return double.infinity;
    return box.localToGlobal(Offset.zero).dy;
  }

  Future<void> _scrollTo(String route) async {
    final key = switch (route) {
      'home' => homeKey,
      'project' => projectKey,
      'contact' => contactKey,
      _ => homeKey,
    };
    final ctx = key.currentContext;
    if (ctx != null) {
      await Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
        alignment: 0, // align to top
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Full-bleed video background
          const IgnorePointer(child: SizedBox.expand(child: VideoBackground())),

          SingleChildScrollView(
            controller: _scroll,
            child: Column(
              spacing: 60,
              children: [
                HomeScreen(key: homeKey),
                SizedBox(height: 300),
                ProjectScreen(
                  key: projectKey,
                  scroll: _projectScroll,
                  projectImages: [
                    "assets/images/music.png",
                    "assets/images/netflix.png",
                    "assets/images/note.png",
                    "assets/images/travel.png",
                  ],
                ),
                SizedBox(height: 800, key: spaceKey),
                ContactScreen(key: contactKey),
              ],
            ),
          ),

          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withValues(alpha: 0.15),
                          spreadRadius: 0.4,
                          blurRadius: 18,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: NavBar(
                      activeRoute: _current,
                      onItemSelected: _scrollTo,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

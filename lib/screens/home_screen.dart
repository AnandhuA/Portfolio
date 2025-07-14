import 'package:flutter/material.dart';
import 'package:portfolio/widgets/nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    key: homeKey,
                    height: 500,
                    width: double.infinity,
                    color: Colors.amber,
                    child: const Center(child: Text("Home")),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    key: projectKey,
                    height: 700,
                    width: double.infinity,
                    color: Colors.purple,
                    child: const Center(child: Text("Project")),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    key: contactKey,
                    height: 500,
                    width: double.infinity,
                    color: Colors.green,
                    child: const Center(child: Text("Contact")),
                  ),
                  Container(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'core/theme/app_theme.dart';
import 'core/widgets/footer.dart';
import 'core/widgets/portfolio_app_bar.dart';
import 'core/widgets/responsive_layout.dart';
import 'core/widgets/scroll_to_top_button.dart';
import 'features/about/about_section.dart';
import 'features/about/certificates_section.dart';
import 'features/about/timeline_section.dart';
import 'features/contact/contact_section.dart';
import 'features/home/widgets/hero_section.dart';
import 'features/home/widgets/starfield_background.dart';
import 'features/home/widgets/tech_stack_section.dart';
import 'features/projects/projects_section.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Abdallah Ali Rehab | Senior Mobile Developer',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      builder: (context, child) => ResponsiveLayout(child: child!),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _certificatesKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  int _activeSection = 0;
  bool _showScrollToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    // Show/hide scroll to top button
    if (_scrollController.offset > 200 && !_showScrollToTop) {
      setState(() => _showScrollToTop = true);
    } else if (_scrollController.offset <= 200 && _showScrollToTop) {
      setState(() => _showScrollToTop = false);
    }

    // Track active section
    _updateActiveSection();
  }

  void _updateActiveSection() {
    final keys = [
      _homeKey,
      _aboutKey,
      _skillsKey,
      _projectsKey,
      _experienceKey,
      _certificatesKey,
      _contactKey,
    ];

    for (int i = 0; i < keys.length; i++) {
      final context = keys[i].currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox?;
        if (box != null) {
          final position = box.localToGlobal(Offset.zero);
          if (position.dy <= 100 && position.dy >= -box.size.height + 100) {
            if (_activeSection != i) {
              setState(() => _activeSection = i);
            }
            break;
          }
        }
      }
    }
  }

  void _scrollToSection(int index) {
    final keys = [
      _homeKey,
      _aboutKey,
      _skillsKey,
      _projectsKey,
      _experienceKey,
      _certificatesKey,
      _contactKey,
    ];

    if (index < keys.length) {
      Scrollable.ensureVisible(
        keys[index].currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToContact() {
    _scrollToSection(6); // Contact is index 6
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const StarfieldBackground(),
          Column(
            children: [
              PortfolioAppBar(
                onNavigate: _scrollToSection,
                activeIndex: _activeSection,
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      HeroSection(
                        key: _homeKey,
                        onContactPressed: _scrollToContact,
                      ),
                      AboutSection(key: _aboutKey),
                      TechStackSection(key: _skillsKey),
                      ProjectsSection(key: _projectsKey),
                      TimelineSection(key: _experienceKey),
                      CertificatesSection(key: _certificatesKey),
                      ContactSection(key: _contactKey),
                      const Footer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: 24,
            bottom: 24,
            child: ScrollToTopButton(
              onPressed: _scrollToTop,
              isVisible: _showScrollToTop,
            ),
          ),
        ],
      ),
    );
  }
}

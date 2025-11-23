import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'core/widgets/footer.dart';
import 'core/widgets/responsive_layout.dart';
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
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToContact() {
    Scrollable.ensureVisible(
      _contactKey.currentContext!,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
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
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                HeroSection(onContactPressed: _scrollToContact),
                const AboutSection(),
                const TechStackSection(),
                const ProjectsSection(),
                const TimelineSection(),
                const CertificatesSection(),
                ContactSection(key: _contactKey),
                const Footer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

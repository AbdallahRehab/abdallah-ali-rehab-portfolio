import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/glass_button.dart';

class ProjectDetailsModal extends StatelessWidget {
  final Map<String, dynamic> project;

  const ProjectDetailsModal({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 800,
        constraints: const BoxConstraints(maxHeight: 700),
        decoration: BoxDecoration(
          color: AppTheme.spaceBlack.withOpacity(0.95),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: AppTheme.neonCyan.withOpacity(0.3),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: AppTheme.neonCyan.withOpacity(0.1),
              blurRadius: 40,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          children: [
            // Header Image
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(22),
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.image_rounded,
                  size: 64,
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            project['name'],
                            style: Theme.of(context).textTheme.displaySmall
                                ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.close, color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        project['description'],
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white70,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Links
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: [
                          if (project['links']?['ios'] != null)
                            GlassButton(
                              text: 'App Store',
                              icon: Icons.apple,
                              onPressed: () =>
                                  launchUrl(Uri.parse(project['links']['ios'])),
                            ),
                          if (project['links']?['android'] != null)
                            GlassButton(
                              text: 'Play Store',
                              icon: Icons.android,
                              onPressed: () => launchUrl(
                                Uri.parse(project['links']['android']),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

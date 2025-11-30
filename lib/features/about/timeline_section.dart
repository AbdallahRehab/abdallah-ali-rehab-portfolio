import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/theme/app_theme.dart';

class TimelineSection extends StatelessWidget {
  const TimelineSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Column(
        children: [
          Text(
            'Experience',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ).animate().fadeIn().slideY(begin: 0.2, end: 0),

          const SizedBox(height: 60),

          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              children: [
                _buildTimelineItem(
                  context,
                  year: 'Dec 2022 - Present',
                  role: 'Senior Mobile Developer',
                  company: 'WalaPlus',
                  description:
                      'WalaPlus is your first source for creating loyalty and happiness programs for your employees and customers.\n\n'
                      '• Developed and maintained WalaOne, WalaPlus, and Doam apps, serving millions of active users, reaching +3M in loyalty and rewards programs with 4.5+ app store ratings.\n'
                      '• Initiated and led the development of Doam from scratch, including architecture design, CI/CD pipelines, and coding standards, serving more than 1.2 million users.\n'
                      '• Enhanced app performance via caching, API optimization, and code refactoring, achieving up to 60% faster load times.\n'
                      '• Implemented unit testing (Mocktail), achieving up to 90% code coverage and reducing bug reports by 70%.\n'
                      '• Introduced modular architecture to reduce coupling and improve maintainability.\n'
                      '• Strengthened app security with a comprehensive threat model protecting against reverse engineering, runtime injections, and MiM attacks.',
                  isLast: false,
                ),
                _buildTimelineItem(
                  context,
                  year: 'Dec 2020 - Dec 2022',
                  role: 'Flutter Developer',
                  company: 'WEDDnGO',
                  description:
                      'Contributed to Egypt\'s largest wedding marketplace app, connecting users with service providers.\n\n'
                      '• Helped secure funding through Shark Tank Egypt by delivering high-quality features and performance improvements.\n'
                      '• Integrated new features including vendor subscriptions, booking systems, and in-app payments.\n'
                      '• Optimized app performance, improving load times and responsiveness.',
                  isLast: false,
                ),
                _buildTimelineItem(
                  context,
                  year: '2016 - 2020',
                  role: 'Bachelor, Computer Science',
                  company: 'Menoufiya University',
                  description: 'GPA 3.2. Faculty of Computers and Information.',
                  isLast: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(
    BuildContext context, {
    required String year,
    required String role,
    required String company,
    required String description,
    required bool isLast,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline Line
          Column(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: AppTheme.neonCyan,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.neonCyan.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: Colors.white.withOpacity(0.1),
                  ),
                ),
            ],
          ),

          const SizedBox(width: 32),

          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    year,
                    style: TextStyle(
                      color: AppTheme.neonCyan,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    role,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    company,
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(color: Colors.white70),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white60,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 200.ms).slideX(begin: 0.1, end: 0);
  }
}

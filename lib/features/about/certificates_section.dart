import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/theme/app_theme.dart';

class CertificatesSection extends StatelessWidget {
  const CertificatesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Column(
        children: [
          Text(
            'Certificates',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ).animate().fadeIn().slideY(begin: 0.2, end: 0),

          const SizedBox(height: 60),

          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              _buildCertificateCard(
                context,
                title: 'Flutter Advanced',
                issuer: 'Udemy',
                date: '2023',
              ),
              _buildCertificateCard(
                context,
                title: 'Clean Architecture',
                issuer: 'Reso Coder',
                date: '2022',
              ),
              _buildCertificateCard(
                context,
                title: 'Mobile Security',
                issuer: 'Google',
                date: '2024',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCertificateCard(
    BuildContext context, {
    required String title,
    required String issuer,
    required String date,
  }) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.05),
            Colors.white.withOpacity(0.02),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          Icon(Icons.workspace_premium, size: 48, color: AppTheme.neonPink),
          const SizedBox(height: 16),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(issuer, style: const TextStyle(color: Colors.white70)),
          const SizedBox(height: 4),
          Text(date, style: TextStyle(color: Colors.white38, fontSize: 12)),
        ],
      ),
    ).animate().fadeIn(delay: 200.ms).scale();
  }
}

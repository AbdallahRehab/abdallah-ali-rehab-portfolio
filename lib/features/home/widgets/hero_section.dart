import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/glass_button.dart';
import '../../../../core/widgets/social_icon.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback? onContactPressed;

  const HeroSection({super.key, this.onContactPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 800),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Floating Avatar/Icon Placeholder
            Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        AppTheme.neonCyan.withOpacity(0.2),
                        AppTheme.neonPink.withOpacity(0.2),
                      ],
                    ),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.neonCyan.withOpacity(0.2),
                        blurRadius: 30,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.rocket_launch_rounded,
                    size: 60,
                    color: Colors.white,
                  ),
                )
                .animate(
                  onPlay: (controller) => controller.repeat(reverse: true),
                )
                .scale(
                  begin: const Offset(1, 1),
                  end: const Offset(1.05, 1.05),
                  duration: 2.seconds,
                  curve: Curves.easeInOut,
                ),

            const SizedBox(height: 40),

            // Name
            Text(
              'Abdallah Ali Rehab',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.3, end: 0),

            const SizedBox(height: 16),

            // Role
            Text(
              'Senior Mobile Developer',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppTheme.neonCyan,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.5,
              ),
              textAlign: TextAlign.center,
            ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.3, end: 0),

            const SizedBox(height: 24),

            // Tagline
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Text(
                'Crafting futuristic mobile experiences with Flutter. Specializing in high-performance, scalable applications for iOS and Android.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white70,
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              ),
            ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.3, end: 0),

            const SizedBox(height: 48),

            // CTAs
            Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: [
                GlassButton(
                  text: 'Download CV',
                  icon: Icons.download_rounded,
                  onPressed: () {
                    launchUrl(Uri.parse('assets/cv.pdf'));
                  },
                ),
                GlassButton(
                  text: 'Contact Me',
                  icon: Icons.mail_outline_rounded,
                  isPrimary: false,
                  onPressed: () {
                    onContactPressed?.call();
                  },
                ),
              ],
            ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.3, end: 0),

            const SizedBox(height: 60),

            // Socials
            Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: const [
                SocialIcon(
                  icon: FontAwesomeIcons.linkedinIn,
                  url:
                      'https://www.linkedin.com/in/abdallah-ali-rehab-a71246153',
                  label: 'LinkedIn',
                ),
                SocialIcon(
                  icon: FontAwesomeIcons.github,
                  url: 'https://github.com/AbdallahRehab',
                  label: 'GitHub',
                ),
                SocialIcon(
                  icon: FontAwesomeIcons.twitter,
                  url: 'https://x.com/abdallahrehab2',
                  label: 'Twitter',
                ),
                SocialIcon(
                  icon: FontAwesomeIcons.whatsapp,
                  url: 'https://wa.me/2001559292997',
                  label: 'WhatsApp',
                ),
              ],
            ).animate().fadeIn(delay: 800.ms).slideY(begin: 0.3, end: 0),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/glass_button.dart';
import '../../../../core/widgets/social_icon.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback? onContactPressed;

  const HeroSection({super.key, this.onContactPressed});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack),
    );

    // Auto-flip every 5 seconds
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) _startAutoFlip();
    });
  }

  void _startAutoFlip() {
    if (!mounted) return;

    // Flip to back
    _controller.forward().then((_) {
      // Wait, then flip to front
      Future.delayed(const Duration(seconds: 5), () {
        if (mounted) {
          _controller.reverse().then((_) {
            // Loop
            Future.delayed(const Duration(seconds: 5), _startAutoFlip);
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 800),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Floating Avatar with Flip Animation
            AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    final angle = _animation.value * 3.14159; // PI
                    final isFront = angle < 1.57; // 90 degrees

                    return Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(angle),
                      alignment: Alignment.center,
                      child: Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              AppTheme.neonCyan.withOpacity(0.2),
                              AppTheme.neonPink.withOpacity(0.2),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          border: Border.all(
                            color: AppTheme.neonCyan.withOpacity(0.5),
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.neonCyan.withOpacity(0.3),
                              blurRadius: 30,
                              spreadRadius: 5,
                            ),
                            BoxShadow(
                              color: AppTheme.neonPink.withOpacity(0.3),
                              blurRadius: 30,
                              spreadRadius: -5,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: isFront
                            ? _buildFrontSide()
                            : Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.identity()..rotateY(3.14159),
                                child: _buildBackSide(),
                              ),
                      ),
                    );
                  },
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
                    launchUrl(
                      Uri.parse(
                        'https://drive.google.com/file/d/11YB2ycBA6I8wdJ4le-BDr2UScJtI9gIf/view?usp=sharing',
                      ),
                      mode: LaunchMode.externalApplication,
                    );
                  },
                ),
                GlassButton(
                  text: 'Contact Me',
                  icon: Icons.mail_outline_rounded,
                  isPrimary: false,
                  onPressed: () {
                    widget.onContactPressed?.call();
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

  Widget _buildFrontSide() {
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('assets/images/avatar.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black.withOpacity(0.2)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }

  Widget _buildBackSide() {
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black.withOpacity(0.5),
      ),
      child: const Center(
        child: Icon(
          Icons.rocket_launch_rounded,
          size: 60,
          color: AppTheme.neonCyan,
        ),
      ),
    );
  }
}

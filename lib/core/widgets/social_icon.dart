import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';

class SocialIcon extends StatefulWidget {
  final IconData icon;
  final String url;
  final String label;

  const SocialIcon({
    super.key,
    required this.icon,
    required this.url,
    required this.label,
  });

  @override
  State<SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<SocialIcon> {
  bool _isHovered = false;

  Future<void> _launchUrl() async {
    final uri = Uri.parse(widget.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.label,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: _launchUrl,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(_isHovered ? 0.1 : 0.05),
              border: Border.all(
                color: _isHovered
                    ? AppTheme.neonPink.withOpacity(0.8)
                    : Colors.white.withOpacity(0.2),
              ),
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: AppTheme.neonPink.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 2,
                      ),
                    ]
                  : [],
            ),
            child: FaIcon(
              widget.icon,
              color: _isHovered ? AppTheme.neonPink : Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}

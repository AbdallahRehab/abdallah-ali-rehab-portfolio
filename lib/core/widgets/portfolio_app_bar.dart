import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class PortfolioAppBar extends StatefulWidget {
  final Function(int) onNavigate;
  final int activeIndex;

  const PortfolioAppBar({
    super.key,
    required this.onNavigate,
    required this.activeIndex,
  });

  @override
  State<PortfolioAppBar> createState() => _PortfolioAppBarState();
}

class _PortfolioAppBarState extends State<PortfolioAppBar> {
  int? _hoveredIndex;

  final List<String> _navItems = [
    'Home',
    'About',
    'Skills',
    'Projects',
    'Experience',
    'Certificates',
    'Contact',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: AppTheme.deepSpace.withOpacity(0.95),
        border: Border(
          bottom: BorderSide(
            color: AppTheme.neonCyan.withOpacity(0.2),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            // Logo/Name
            Text(
              'AR',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..shader = LinearGradient(
                    colors: [AppTheme.neonCyan, AppTheme.neonPink],
                  ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
              ),
            ),
            const Spacer(),
            // Navigation Items
            ...List.generate(_navItems.length, (index) {
              final isActive = widget.activeIndex == index;
              final isHovered = _hoveredIndex == index;

              return MouseRegion(
                onEnter: (_) => setState(() => _hoveredIndex = index),
                onExit: (_) => setState(() => _hoveredIndex = null),
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => widget.onNavigate(index),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: isActive
                              ? AppTheme.neonCyan
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Text(
                      _navItems[index],
                      style: TextStyle(
                        color: isActive
                            ? AppTheme.neonCyan
                            : isHovered
                            ? AppTheme.neonPink
                            : Colors.white70,
                        fontSize: 16,
                        fontWeight: isActive
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

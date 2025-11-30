import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class PortfolioAppBar extends StatefulWidget {
  final Function(int) onNavigate;
  final int activeIndex;
  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  const PortfolioAppBar({
    super.key,
    required this.onNavigate,
    required this.activeIndex,
    required this.onThemeToggle,
    required this.isDarkMode,
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
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: isDark
            ? AppTheme.deepSpace.withOpacity(0.95)
            : AppTheme.lightSurface.withOpacity(0.95),
        border: Border(
          bottom: BorderSide(
            color: isDark
                ? AppTheme.neonCyan.withOpacity(0.2)
                : AppTheme.accentCyan.withOpacity(0.2),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.3 : 0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
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
                              ? (isDark
                                    ? AppTheme.neonCyan
                                    : AppTheme.accentCyan)
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Text(
                      _navItems[index],
                      style: TextStyle(
                        color: isActive
                            ? (isDark ? AppTheme.neonCyan : AppTheme.accentCyan)
                            : isHovered
                            ? (isDark ? AppTheme.neonPink : AppTheme.accentPink)
                            : (isDark
                                  ? Colors.white70
                                  : AppTheme.lightText.withOpacity(0.7)),
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
            const SizedBox(width: 16),
            // Theme Toggle Button
            IconButton(
              onPressed: widget.onThemeToggle,
              icon: Icon(
                widget.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                color: isDark ? AppTheme.neonCyan : AppTheme.accentCyan,
              ),
              tooltip: widget.isDarkMode
                  ? 'Switch to Light Mode'
                  : 'Switch to Dark Mode',
            ),
          ],
        ),
      ),
    );
  }
}

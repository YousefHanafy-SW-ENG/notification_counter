import 'package:flutter/material.dart';

class PillBottomNav extends StatelessWidget {
  const PillBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.items = const [
      PillNavItem(Icons.home_rounded),
      PillNavItem(Icons.add_circle_outline_rounded),
      PillNavItem(Icons.chat_bubble_outline_rounded),
      PillNavItem(Icons.person_outline_rounded),
    ],
    this.margin = const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    this.height = 64,
    this.background = const Color(0xFF2C2C2E),
    this.activeItemBg = Colors.black,
    this.activeIconColor = const Color(0xFFB7FF7A),
    this.inactiveIconColor = Colors.white,
    this.inactiveIconOpacity = 0.85,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<PillNavItem> items;

  final EdgeInsets margin;
  final double height;
  final Color background;
  final Color activeItemBg;
  final Color activeIconColor;
  final Color inactiveIconColor;
  final double inactiveIconOpacity;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      minimum: margin,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          height: height,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(height / 2),
            boxShadow: const [
              BoxShadow(
                blurRadius: 16,
                offset: Offset(0, 6),
                color: Colors.black26,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(items.length, (i) {
              final selected = i == currentIndex;
              if (selected) {
                return _SelectedCircleButton(
                  icon: items[i].icon,
                  onTap: () => onTap(i),
                  bg: activeItemBg,
                  iconColor: activeIconColor,
                );
              } else {
                return _IconButton(
                  icon: items[i].icon,
                  onTap: () => onTap(i),
                  color: inactiveIconColor.withOpacity(inactiveIconOpacity),
                );
              }
            }),
          ),
        ),
      ),
    );
  }
}

class PillNavItem {
  final IconData icon;
  const PillNavItem(this.icon);
}

class _SelectedCircleButton extends StatelessWidget {
  const _SelectedCircleButton({
    required this.icon,
    required this.onTap,
    required this.bg,
    required this.iconColor,
  });

  final IconData icon;
  final VoidCallback onTap;
  final Color bg;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkResponse(
        onTap: onTap,
        radius: 28,
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: bg,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Icon(icon, size: 26, color: iconColor),
        ),
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  const _IconButton({
    required this.icon,
    required this.onTap,
    required this.color,
  });

  final IconData icon;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkResponse(
        onTap: onTap,
        radius: 28,
        child: SizedBox(
          width: 48,
          height: 48,
          child: Icon(icon, size: 26, color: color),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notification_counter/core/helpers/app_assets.dart';

class PillBottomNav extends StatelessWidget {
  const PillBottomNav._({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
    this.margin = const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    this.height = 64,
    this.background = const Color(0xFF2C2C2E),
    this.activeItemBg = Colors.black,
    this.activeIconColor = const Color(0xFFB7FF7A),
    this.inactiveIconColor = Colors.white,
    this.inactiveIconOpacity = 0.85,
  });

  /// Factory constructor so you can provide custom items or rely on defaults.
  factory PillBottomNav({
    Key? key,
    required int currentIndex,
    required ValueChanged<int> onTap,
    List<PillNavItem>? items,
    EdgeInsets margin = const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    double height = 64,
    Color background = const Color(0xFF2C2C2E),
    Color activeItemBg = Colors.black,
    Color activeIconColor = const Color(0xFFB7FF7A),
    Color inactiveIconColor = Colors.white,
    double inactiveIconOpacity = 0.85,
  }) {
    return PillBottomNav._(
      key: key,
      currentIndex: currentIndex,
      onTap: onTap,
      items: items ??
          [
            PillNavItem(AppAssets.icons.homeIcon),
            PillNavItem(AppAssets.icons.plusIcon),
            PillNavItem(AppAssets.icons.speechBubbleIcon),
            PillNavItem(AppAssets.icons.personIcon),
          ],
      margin: margin,
      height: height,
      background: background,
      activeItemBg: activeItemBg,
      activeIconColor: activeIconColor,
      inactiveIconColor: inactiveIconColor,
      inactiveIconOpacity: inactiveIconOpacity,
    );
  }

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
        padding: const EdgeInsets.symmetric(horizontal: 40),
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
                  assetPath: items[i].assetPath,
                  onTap: () => onTap(i),
                  bg: activeItemBg,
                  iconColor: activeIconColor,
                );
              } else {
                return _IconButton(
                  assetPath: items[i].assetPath,
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
  final String assetPath; // expects an SVG asset path
  const PillNavItem(this.assetPath);
}

class _SelectedCircleButton extends StatelessWidget {
  const _SelectedCircleButton({
    required this.assetPath,
    required this.onTap,
    required this.bg,
    required this.iconColor,
  });

  final String assetPath;
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
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: bg,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            assetPath,
            width: 28,
            height: 28,
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  const _IconButton({
    required this.assetPath,
    required this.onTap,
    required this.color,
  });

  final String assetPath;
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
          width: 28,
          height: 28,
          child: SvgPicture.asset(
            assetPath,
            width: 28,
            height: 28,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}

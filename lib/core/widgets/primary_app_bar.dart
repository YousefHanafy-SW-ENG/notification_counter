import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notification_counter/core/theming/app_colors.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PrimaryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: const Icon(
          Icons.arrow_back_ios_sharp,
          color: AppColors.black,
          size: 24,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

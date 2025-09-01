import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notification_counter/core/helpers/app_assets.dart';
import 'package:notification_counter/core/helpers/spacer.dart';
import 'package:notification_counter/core/theming/app_colors.dart';
import 'package:notification_counter/core/widgets/custom_svg_icon.dart';
import 'package:notification_counter/core/widgets/custom_text.dart';
import 'package:notification_counter/features/notifications/presentation/providers/notification_notifier.dart';
import 'package:notification_counter/features/notifications/presentation/widgets/notification_badge.dart';

class CustomHomeAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomHomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 30);
  // ↑ add extra space below the normal toolbar height

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(notificationProvider.notifier);

    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      height: MediaQuery.of(context).padding.top + kToolbarHeight + 30,
      color: AppColors.whiteBackground,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                decoration: BoxDecoration(
                  color: AppColors.whiteBackground,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppColors.greenColor),
                ),
                child: const CustomText(
                  text: "For you",
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                ),
              ),
              const HorizontalSpace(width: 16),
              const CustomText(
                text: "Following",
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ],
          ),

          // right icons
          Row(
            children: [
              CustomSvgIcon(assetName: AppAssets.icons.replyArrowIcon),
              const HorizontalSpace(width: 26),
              CustomSvgIcon(assetName: AppAssets.icons.filterIcon),
              const HorizontalSpace(width: 18),
              SizedBox(
                width: 36,
                height: 56,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Center(
                      child: GestureDetector(
                        onTap: () => notifier.increment(),
                        child: CustomSvgIcon(
                          assetName: AppAssets.icons.notificationIcon,
                        ),
                      ),
                    ),
                    const Positioned(
                      left: -1,
                      top: 40,
                      child: NotificationBadge(),
                    ),
                    const Positioned(
                      right: 0,
                      top: 12,
                      child: CircleAvatar(
                        radius: 4,
                        backgroundColor: AppColors.greenColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notification_counter/core/theming/app_colors.dart';
import 'package:notification_counter/core/widgets/custom_svg_icon.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({
    super.key,
    this.leadingRightPadding,
    this.leadingIconPath,
    this.leadingIconWidth,
    this.leadingIconHeight,
    this.titleWidget,
    this.actionWidget,
    this.onTap,
  });

  final double? leadingRightPadding;
  final String? leadingIconPath;
  final double? leadingIconWidth;
  final double? leadingIconHeight;
  final Widget? titleWidget;
  final Widget? actionWidget;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      backgroundColor: AppColors.mainWhite,
      leading:
          leadingIconPath != null
              ? InkWell(
                onTap: () {
                  if (onTap != null) {
                    onTap!();
                  }
                  context.pop();
                },
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: leadingRightPadding ?? 16,
                  ),
                  child: CustomSvgIcon(
                    assetName: leadingIconPath!,
                    color: AppColors.primaryText,
                    width: leadingIconWidth ?? 24,
                    height: leadingIconHeight ?? 24,
                  ),
                ),
              )
              : IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back, color: AppColors.black, size: 24),
              ),
      leadingWidth: 24,
      title: titleWidget ?? const SizedBox(),
      actions: [actionWidget ?? const SizedBox()],
      elevation: 0,
      shadowColor: Colors.white,
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(45);
}

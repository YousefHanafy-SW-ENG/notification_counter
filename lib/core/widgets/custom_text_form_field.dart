import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notification_counter/core/theming/app_colors.dart';
import 'package:notification_counter/core/widgets/custom_svg_icon.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.textController,
    this.textDirection = TextDirection.rtl,
    this.onChanged,
    this.onTap,
    this.validate,
    required this.hint,
    this.hintSize,
    this.prefix,
    this.suffix,
    this.suffixPressed,
    this.inputAction,
    required this.type,
    this.isPasswordHidden = false,
    this.isClickable = true,
    this.readOnly = false,
    this.backgroundColor,
    this.hintColor,
    this.hasBorder = true,
    this.textAlign = TextAlign.right,
    this.borderColor,
    this.contentPadding,
    this.isCollapsed,
    this.prefixWidget,
    this.hintWeight,
    this.maxLength = 100,
    this.hintFontWeight = FontWeight.w400,
    this.focusedPrefixSvgPath,
    this.errorPrefixSvgPath,
    this.secondarySuffixSvgPath,
    this.showSecondarySuffix = false,
  });

  final TextEditingController textController;
  final TextDirection textDirection;
  final TextInputType type;
  final Function? onChanged;
  final Function? onTap;
  final Function? validate;
  final String hint;
  final TextAlign textAlign;
  final double? hintSize;
  final IconData? prefix;
  final String? suffix;
  final bool isPasswordHidden;
  final bool hasBorder;
  final Color? borderColor;
  final FontWeight hintFontWeight;
  final Function? suffixPressed;
  final bool isClickable;
  final int maxLength;
  final bool readOnly;

  final TextInputAction? inputAction;

  final Color? backgroundColor;
  final Color? hintColor;

  final bool? isCollapsed;
  final EdgeInsets? contentPadding;

  final Widget? prefixWidget;

  final FontWeight? hintWeight;

  final String? focusedPrefixSvgPath;
  final String? errorPrefixSvgPath;

  // NEW
  final String? secondarySuffixSvgPath;
  final bool showSecondarySuffix;

  @override
  CustomTextFormFieldState createState() => CustomTextFormFieldState();
}

class CustomTextFormFieldState extends State<CustomTextFormField> {
  final FocusNode _focusNode = FocusNode();
  final GlobalKey<FormFieldState> _fieldKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: TextFormField(
        key: _fieldKey,
        textAlign: widget.textAlign,
        maxLength: widget.maxLength,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        focusNode: _focusNode,
        onTap: () {
          if (widget.onTap != null) widget.onTap!();
        },
        onChanged: (String value) {
          if (widget.onChanged != null) widget.onChanged!();
          setState(() {});
        },
        textDirection: widget.textDirection,
        controller: widget.textController,
        keyboardType: widget.type,
        obscureText: widget.isPasswordHidden,
        textInputAction: widget.inputAction,
        validator: (value) {
          final result = widget.validate?.call(value);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) setState(() {});
          });
          return result;
        },
        enabled: widget.isClickable,
        readOnly: widget.readOnly,
        cursorColor: AppColors.brownColor,
        cursorWidth: 1.5,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
        decoration: InputDecoration(
          counter: const SizedBox.shrink(),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          focusedBorder:
              widget.hasBorder
                  ? OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: AppColors.brownColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  )
                  : InputBorder.none,
          enabledBorder:
              widget.hasBorder
                  ? OutlineInputBorder(
                    borderSide: BorderSide(
                      color: widget.borderColor ?? AppColors.grey1,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  )
                  : InputBorder.none,
          errorBorder:
              widget.hasBorder
                  ? OutlineInputBorder(
                    borderSide: BorderSide(
                      color: widget.borderColor ?? AppColors.red,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  )
                  : InputBorder.none,
          focusedErrorBorder:
              widget.hasBorder
                  ? OutlineInputBorder(
                    borderSide: BorderSide(
                      color: widget.borderColor ?? AppColors.red,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  )
                  : InputBorder.none,
          isCollapsed: widget.isCollapsed,
          fillColor: widget.backgroundColor ?? AppColors.white7,
          filled: true,
          hintText: widget.hint,
          hintStyle: TextStyle(
            fontSize: widget.hintSize ?? 13,
            color: widget.hintColor ?? AppColors.grey8,
            fontWeight: widget.hintFontWeight,
          ),
          errorStyle: const TextStyle(fontSize: 12),
          prefixIconConstraints: const BoxConstraints(
            minHeight: 0,
            minWidth: 0,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(start: 16, end: 8),
            child:
                _focusNode.hasFocus && widget.focusedPrefixSvgPath != null
                    ? SvgPicture.asset(
                      widget.focusedPrefixSvgPath!,
                      key: const ValueKey('focused'),
                    )
                    : (_fieldKey.currentState?.hasError ?? false) &&
                        widget.errorPrefixSvgPath != null
                    ? SvgPicture.asset(
                      widget.errorPrefixSvgPath!,
                      key: const ValueKey('error'),
                    )
                    : widget.prefixWidget ??
                        (widget.prefix != null
                            ? Icon(
                              widget.prefix,
                              key: const ValueKey('default'),
                              color: AppColors.primaryColor,
                              size: 20,
                            )
                            : null),
          ),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.showSecondarySuffix &&
                  widget.secondarySuffixSvgPath != null)
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: CustomSvgIcon(
                    assetName: widget.secondarySuffixSvgPath!,
                  ),
                ),
              if (widget.suffix != null)
                IconButton(
                  padding: const EdgeInsets.only(left: 6),
                  iconSize: 20,
                  splashColor: Colors.transparent,
                  onPressed: () {
                    if (widget.suffixPressed != null) widget.suffixPressed!();
                  },
                  icon: CustomSvgIcon(
                    assetName: widget.suffix!,
                    color: AppColors.grey12,
                  ),
                ),
            ],
          ),
          contentPadding:
              widget.contentPadding ??
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
      ),
    );
  }
}

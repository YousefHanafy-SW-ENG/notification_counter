// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:kitchen_up/core/helpers/app_images.dart';
// import 'package:kitchen_up/core/helpers/spacer.dart';
// import 'package:kitchen_up/core/theming/app_colors.dart';
// import 'package:kitchen_up/core/widgets/custom_circle_avatar.dart';
// import 'package:kitchen_up/core/widgets/custom_svg_icon.dart';
// import 'package:kitchen_up/core/widgets/custom_text.dart';
//
// class CustomDropFieldButton extends StatelessWidget {
//   const CustomDropFieldButton({
//     super.key,
//     required this.data,
//     required this.onChangeFunction,
//     required this.hint,
//     required this.selectedValue,
//     this.validator,
//     required this.isImageDisplayed,
//     this.image,
//     this.iconColor,
//     this.iconStartSpace,
//     this.iconIsSpaced,
//   });
//
//   final String hint;
//   final List<String> data;
//   final String? selectedValue;
//   final Function onChangeFunction;
//   final String? Function(String?)? validator;
//   final bool isImageDisplayed;
//   final String? image;
//   final Color? iconColor;
//   final double? iconStartSpace;
//   final bool? iconIsSpaced;
//
//   @override
//   Widget build(BuildContext context) {
//     // Ensure unique values
//     List<String> uniqueData = data.toSet().toList();
//
//     // Ensure selected value exists
//     String? selectedValueSafe =
//         uniqueData.contains(selectedValue) ? selectedValue : null;
//
//     // Debugging: Print list
//     print("Dropdown Items: ${uniqueData.join(", ")}");
//
//     return DropdownButtonFormField2<String>(
//       isExpanded: true,
//       isDense: true,
//       value: selectedValueSafe,
//
//       ///---------- DECORATION ----------///
//       decoration: InputDecoration(
//         contentPadding: const EdgeInsets.symmetric(vertical: 0),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: AppColors.grey1, width: 1.w),
//           borderRadius: BorderRadius.circular(4.r),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: AppColors.grey1, width: 1.w),
//           borderRadius: BorderRadius.circular(4.r),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: AppColors.grey1, width: 1.w),
//           borderRadius: BorderRadius.circular(4.r),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: AppColors.grey1, width: 1.w),
//           borderRadius: BorderRadius.circular(4.r),
//         ),
//         filled: true,
//         fillColor: AppColors.mainWhite,
//         errorStyle: TextStyle(fontSize: 11.sp),
//       ),
//
//       ///---------- HINT ----------///
//       hint: CustomText(text: hint, fontSize: 16.sp, color: AppColors.grey4),
//
//       ///---------- ITEMS ----------///
//       items: uniqueData.map((item) {
//         return DropdownMenuItem<String>(
//           value: item,
//           child: isImageDisplayed
//               ? Row(
//                   children: [
//                     image != null
//                         ? CustomCircleAvatar(image: image!, circleRaduis: 12)
//                         : const CircleAvatar(radius: 12),
//                     const HorizontalSpace(width: 8),
//                     CustomText(
//                       text: item,
//                       fontWeight: FontWeight.w600,
//                       color: AppColors.primaryColorShade80,
//                     ),
//                   ],
//                 )
//               : CustomText(
//                   text: item,
//                   fontWeight: FontWeight.w600,
//                   color: AppColors.primaryColorShade80,
//                 ),
//         );
//       }).toList(),
//
//       ///---------- VALIDATION ----------///
//       validator: validator,
//
//       ///---------- ON TAP ----------///
//       onChanged: (value) => onChangeFunction(value),
//
//       ///---------- CONTENT PADDING ----------///
//       buttonStyleData: ButtonStyleData(
//           height: 40.h, padding: EdgeInsetsDirectional.only(end: 16.w)),
//
//       ///---------- ICON ----------///
//       iconStyleData: IconStyleData(
//         icon: Expanded(
//             child: iconIsSpaced != null
//                 ? Row(
//                     children: [
//                       const Spacer(),
//                       Padding(
//                         padding: EdgeInsetsDirectional.only(
//                             start: iconStartSpace ?? 8.w),
//                         child: CustomSvgIcon(
//                           assetName: AppImages.arrowDownIcon,
//                           color: iconColor ?? AppColors.grey4,
//                         ),
//                       )
//                     ],
//                   )
//                 : Padding(
//                     padding: EdgeInsetsDirectional.only(
//                         start: iconStartSpace ?? 8.w),
//                     child: CustomSvgIcon(
//                       assetName: AppImages.arrowDownIcon,
//                       color: iconColor ?? AppColors.grey4,
//                     ),
//                   )),
//       ),
//     );
//   }
// }

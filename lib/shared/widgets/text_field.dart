import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_planner/app/theme.dart';

class CTextField extends StatelessWidget {
  final String? iconAssetPath;
  final String placeholder;
  final TextEditingController controller;
  final Function(String) onChanged;
  final int? maxLines;
  final TextInputType? keyboardType;

  const CTextField({
    super.key,
    this.iconAssetPath,
    required this.placeholder,
    required this.controller,
    required this.onChanged,
    this.maxLines,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: CupertinoTextField(
        style: titleStyle.copyWith(fontSize: 15.sp),
        padding: padding,
        maxLines: maxLines,
        onChanged: onChanged,
        controller: controller,
        placeholder: placeholder,
        decoration: BoxDecoration(
          color: surfaceColor,
          border: null,
          borderRadius: borderRadius16,
        ),
        keyboardType: keyboardType,
        enableInteractiveSelection: keyboardType != null ? false : null,
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trip_planner/app/theme.dart';

class CButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final bool active;
  final Widget? icon;
  final BorderRadius? borderRadius;
  const CButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.active,
    this.icon,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CupertinoButton.filled(
            borderRadius: borderRadius ?? borderRadius12,
            onPressed: active ? onPressed : null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null)
                  Row(
                    children: [
                      icon!,
                      SizedBox(width: 8.w),
                    ],
                  ),
                Text(
                  title,
                  style: TextStyle(
                    color: active ? Colors.white : Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

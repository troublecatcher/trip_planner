import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trip_planner/app/theme.dart';
import 'package:trip_planner/shared/widgets/container.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final String iconAssetPath;
  final Function(BuildContext) onPressed;

  const SettingsItem({
    super.key,
    required this.title,
    required this.iconAssetPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (ctx) {
      return CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () => onPressed(ctx),
        child: CContainer(
          child: Padding(
            padding: padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      iconAssetPath,
                      width: 24.r,
                      height: 24.r,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      title,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: CupertinoTheme.of(context).primaryColor,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_planner/app/theme.dart';
import 'package:trip_planner/shared/layout/section.dart';

class SectionWithTitle extends StatelessWidget {
  final String title;
  final Widget child;
  const SectionWithTitle({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Section(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: titleStyle,
                ),
              ],
            ),
            SizedBox(height: 8.h),
            child,
          ],
        )
      ],
    );
  }
}

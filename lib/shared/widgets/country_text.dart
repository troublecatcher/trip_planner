import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_planner/app/theme.dart';

class CountryText extends StatelessWidget {
  final String title;
  const CountryText(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: titleStyle.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 20.sp,
      ),
    );
  }
}

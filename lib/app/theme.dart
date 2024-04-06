import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const theme = CupertinoThemeData(
  brightness: Brightness.dark,
  primaryColor: Color.fromRGBO(61, 64, 109, 1),
  scaffoldBackgroundColor: Color.fromRGBO(17, 17, 17, 1),
  barBackgroundColor: Color.fromRGBO(17, 17, 17, 1),
);

final EdgeInsets hpadding = EdgeInsets.symmetric(horizontal: 16.w);
final EdgeInsets vpadding = EdgeInsets.symmetric(vertical: 12.h);
final EdgeInsets padding =
    EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h);
const surfaceColor = Color.fromRGBO(245, 245, 245, 0.08);
final BorderRadius borderRadius16 = BorderRadius.circular(16.r);
final BorderRadius borderRadius12 = BorderRadius.circular(12.r);

final titleStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w500,
  fontSize: 16.sp,
);
final subtitleStyle = TextStyle(
  color: surfaceColor.withOpacity(0.4),
  fontWeight: FontWeight.w500,
  fontSize: 14.sp,
);

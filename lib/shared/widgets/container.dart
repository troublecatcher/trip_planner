import 'package:flutter/cupertino.dart';
import 'package:trip_planner/app/theme.dart';

class CContainer extends StatelessWidget {
  final Widget child;
  final BorderRadius? borderRadius;

  const CContainer({super.key, required this.child, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: borderRadius ?? borderRadius16,
      ),
      child: child,
    );
  }
}

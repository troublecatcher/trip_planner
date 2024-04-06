import 'package:flutter/cupertino.dart';
import 'package:trip_planner/app/theme.dart';
import 'package:trip_planner/shared/layout/section.dart';
import 'package:trip_planner/shared/widgets/container.dart';

class InfoBox extends StatelessWidget {
  final String title;
  final String value;

  const InfoBox({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return CContainer(
      child: Section(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: subtitleStyle,
          ),
          Text(
            value,
            style: titleStyle,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trip_planner/app/theme.dart';
import 'package:trip_planner/features/home/domain/plan/plan.dart';
import 'package:trip_planner/shared/widgets/country_text.dart';

class FlightInfo extends StatelessWidget {
  const FlightInfo({
    super.key,
    required this.plan,
  });

  final Plan plan;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                plan.departure.city,
                style: subtitleStyle,
              ),
              CountryText(plan.departure.country),
            ],
          ),
        ),
        Expanded(
          child: SvgPicture.asset(
            'assets/icons/plane.svg',
            width: 24.r,
            height: 24.r,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                plan.arrival.city,
                style: subtitleStyle,
              ),
              CountryText(plan.arrival.country),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trip_planner/app/theme.dart';
import 'package:trip_planner/features/home/domain/plan/plan.dart';
import 'package:trip_planner/features/home/view/dialogs/flight_dialog.dart';
import 'package:trip_planner/features/home/view/widgets/flight_info.dart';
import 'package:trip_planner/features/home/view/widgets/info_box.dart';
import 'package:trip_planner/shared/layout/section.dart';
import 'package:trip_planner/shared/util/format_date.dart';
import 'package:trip_planner/shared/layout/section_with_title_and_button.dart';
import 'package:trip_planner/shared/util/format_duration.dart';
import 'package:trip_planner/shared/widgets/container.dart';
import 'package:trip_planner/shared/widgets/country_text.dart';

class FlightBody extends StatelessWidget {
  const FlightBody({
    super.key,
    required this.plan,
  });

  final Plan plan;

  @override
  Widget build(BuildContext context) {
    return SectionWithTitleAndButton(
      title: 'Flight',
      buttonTitle: 'Edit',
      onPressed: () => showCupertinoModalPopup(
        context: context,
        builder: (context) => FlightDialog(plan: plan),
      ),
      child: Column(
        children: [
          CContainer(
            child: Padding(
              padding: padding,
              child: Column(
                children: [
                  FlightInfo(plan: plan),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: InfoBox(
                          title: 'Ticket price',
                          value: '\$${plan.ticketPrice}',
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: InfoBox(
                          title: 'Flight time',
                          value: formatDuration(
                            plan.arrival.dateTime
                                .difference(plan.departure.dateTime),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 8.h),
          CContainer(
            child: Section(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/takeoff.svg',
                      width: 24.r,
                      height: 24.r,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      'Departure',
                      style: titleStyle.copyWith(
                          color: CupertinoTheme.of(context).primaryColor),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      plan.departure.city,
                      style: subtitleStyle,
                    )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: CountryText(plan.departure.country)),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: InfoBox(
                        value: intl.format(plan.departure.dateTime),
                        title: 'Date and time',
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: InfoBox(
                        value: plan.departure.airport,
                        title: 'Airport',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 8.h),
          CContainer(
            child: Section(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/takeoff.svg',
                      width: 24.r,
                      height: 24.r,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      'Arrival',
                      style: titleStyle.copyWith(
                          color: CupertinoTheme.of(context).primaryColor),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      plan.arrival.city,
                      style: subtitleStyle,
                    )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: CountryText(plan.arrival.country)),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: InfoBox(
                        value: intl.format(plan.arrival.dateTime),
                        title: 'Date and time',
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: InfoBox(
                        value: plan.arrival.airport,
                        title: 'Airport',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}

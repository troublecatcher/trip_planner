import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trip_planner/app/router/router.dart';
import 'package:trip_planner/app/theme.dart';
import 'package:trip_planner/features/home/domain/plan/plan.dart';
import 'package:trip_planner/features/home/view/widgets/flight_info.dart';
import 'package:trip_planner/shared/layout/section.dart';
import 'package:trip_planner/shared/util/format_date.dart';
import 'package:trip_planner/shared/layout/section_with_title_and_button.dart';
import 'package:trip_planner/shared/util/format_duration.dart';
import 'package:trip_planner/shared/widgets/button.dart';
import 'package:trip_planner/shared/widgets/container.dart';
import 'package:trip_planner/shared/widgets/country_text.dart';

class HotelBody extends StatelessWidget {
  const HotelBody({
    super.key,
    required this.plan,
  });

  final Plan plan;

  @override
  Widget build(BuildContext context) {
    return SectionWithTitleAndButton(
      title: 'Hotel',
      buttonTitle: 'Edit',
      onPressed: () => context.router.push(HotelRoute(plan: plan)),
      child: Builder(builder: (context) {
        if (plan.hotelName != null && plan.hotelName != '') {
          return Column(
            children: [
              CContainer(
                child: Padding(
                  padding: padding,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            plan.arrival.city,
                            style: subtitleStyle,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CountryText(plan.hotelName!),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(245, 245, 245, 0.08),
                          borderRadius: borderRadius16,
                        ),
                        padding: padding,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Price per day',
                              style: subtitleStyle,
                            ),
                            Text(
                              '\$${plan.hotelPrice}',
                              style: titleStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
            ],
          );
        } else {
          return Column(
            children: [
              CContainer(
                child: Section(
                  children: [
                    Text(
                      'You haven’t specified the hotel you’re staying in',
                      style: titleStyle.copyWith(fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Add hotel to plan your trip',
                      style: subtitleStyle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8.h),
                    CButton(
                      title: 'Add hotel',
                      onPressed: () =>
                          context.router.push(HotelRoute(plan: plan)),
                      active: true,
                      icon: SvgPicture.asset(
                        'assets/icons/bed.svg',
                        width: 24.r,
                        height: 24.r,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
            ],
          );
        }
      }),
    );
  }
}

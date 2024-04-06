import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trip_planner/app/router/router.dart';
import 'package:trip_planner/app/theme.dart';
import 'package:trip_planner/features/home/domain/note/note.dart';
import 'package:trip_planner/features/home/domain/plan/plan.dart';
import 'package:trip_planner/shared/layout/section.dart';
import 'package:trip_planner/shared/layout/section_with_title_and_button.dart';
import 'package:trip_planner/shared/widgets/button.dart';
import 'package:trip_planner/shared/widgets/container.dart';

class NotesBody extends StatelessWidget {
  const NotesBody({
    super.key,
    required this.plan,
  });

  final Plan plan;

  @override
  Widget build(BuildContext context) {
    return SectionWithTitleAndButton(
      title: 'Notes',
      buttonTitle: 'Edit',
      onPressed: () => context.router.push(NotesRoute(plan: plan)),
      child: Builder(
        builder: (context) {
          if (plan.notes != null) {
            return ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final note = plan.notes![index];
                return CContainer(
                  child: Section(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            note.description,
                            style: titleStyle,
                          )),
                        ],
                      ),
                      if (note.price != 0) SizedBox(height: 8.h),
                      if (note.price != 0)
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
                                'Price',
                                style: subtitleStyle,
                              ),
                              Text(
                                '\$${note.price}',
                                style: titleStyle,
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 8.h),
              itemCount: plan.notes!.length,
            );
          } else {
            return CContainer(
              child: Section(
                children: [
                  Text(
                    'You don’t have any notes added',
                    style: titleStyle.copyWith(fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'Add notes to plan your trip',
                    style: subtitleStyle,
                  ),
                  SizedBox(height: 8.h),
                  CButton(
                    title: 'Add notes',
                    onPressed: () =>
                        context.router.push(NotesRoute(plan: plan)),
                    active: true,
                    icon: SvgPicture.asset(
                      'assets/icons/note.svg',
                      width: 24.r,
                      height: 24.r,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

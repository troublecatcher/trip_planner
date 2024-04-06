import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trip_planner/app/router/router.dart';
import 'package:trip_planner/features/home/controller/plan_list_cubit.dart';
import 'package:trip_planner/features/home/domain/plan/plan.dart';
import 'package:trip_planner/features/home/view/widgets/flight_info.dart';
import 'package:trip_planner/shared/widgets/button.dart';
import 'package:trip_planner/shared/widgets/container.dart';
import 'package:trip_planner/app/theme.dart';

@RoutePage()
class PlansScreen extends StatelessWidget {
  const PlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
          child: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(
            largeTitle: Text('Planned trips'),
          ),
          BlocBuilder<PlanListCubit, List<Plan>>(
            builder: (context, state) {
              return SliverList.separated(
                itemCount: state.length,
                itemBuilder: (context, index) {
                  Plan plan = state[index];
                  int sum = plan.ticketPrice;
                  if (plan.hotelPrice != null) {
                    sum += plan.hotelPrice!;
                  }
                  if (plan.notes != null) {
                    int expenses = plan.notes!
                        .fold(0, (prev, note) => prev += note.price!);
                    sum += expenses;
                  }
                  return Padding(
                    padding: hpadding,
                    child: CContainer(
                      child: Column(
                        children: [
                          Padding(
                            padding: padding,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Text(
                                  plan.title,
                                  style: titleStyle.copyWith(fontSize: 18.sp),
                                )),
                                Expanded(
                                  child: SvgPicture.asset(
                                    'assets/icons/ticket.svg',
                                    width: 24.r,
                                    height: 24.r,
                                    alignment: Alignment.centerRight,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(color: surfaceColor),
                          Padding(
                            padding: padding,
                            child: Column(
                              children: [
                                FlightInfo(plan: plan),
                                SizedBox(height: 24.h),
                                CContainer(
                                  borderRadius: borderRadius12,
                                  child: Padding(
                                    padding: padding,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Text(
                                            'Total travel expenses',
                                            style: subtitleStyle,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            '\$$sum',
                                            style: titleStyle,
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                CButton(
                                  title: 'Open full plan',
                                  onPressed: () => context.router
                                      .push(SingleItemRoute(index: index)),
                                  active: true,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 8.h),
              );
            },
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: padding,
              child: CButton(
                title: 'Add plan',
                onPressed: () => context.router.push(NameRoute()),
                active: true,
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 24.r,
                ),
                borderRadius: borderRadius16,
              ),
            ),
          ),
        ],
      )),
    );
  }
}

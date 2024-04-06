import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trip_planner/app/theme.dart';
import 'package:trip_planner/features/home/controller/plan_list_cubit.dart';
import 'package:trip_planner/features/home/domain/plan/plan.dart';
import 'package:trip_planner/features/home/view/dialogs/delete_dialog.dart';
import 'package:trip_planner/features/home/view/widgets/flight_body.dart';
import 'package:trip_planner/features/home/view/widgets/hotel_body.dart';
import 'package:trip_planner/features/home/view/widgets/notes_body.dart';
import 'package:trip_planner/shared/layout/section.dart';
import 'package:trip_planner/shared/widgets/expansion_panel.dart';
import 'package:trip_planner/shared/widgets/text_button.dart';

bool deleting = false;

@RoutePage()
class SingleItemScreen extends StatefulWidget {
  final int index;
  const SingleItemScreen({Key? key, required this.index}) : super(key: key);

  @override
  SingleItemScreenState createState() => SingleItemScreenState();
}

class SingleItemScreenState extends State<SingleItemScreen> {
  bool deleting = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Column(
          children: [
            const Text('Plan'),
            BlocBuilder<PlanListCubit, List<Plan>>(
              builder: (context, state) {
                if (!deleting) {
                  Plan plan = state[widget.index];
                  return Text(
                    plan.title,
                    style: subtitleStyle.copyWith(fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  );
                } else {
                  return const CupertinoActivityIndicator();
                }
              },
            ),
          ],
        ),
        trailing: CTextButton(
          title: 'Delete',
          onPressed: () => showCupertinoDialog(
            context: context,
            builder: (context) => DeleteDialog(
                index: widget.index,
                onDelete: () {
                  setState(() {
                    deleting = true;
                  });
                }),
          ).whenComplete(() {
            if (deleting) {
              context.router.popForced();
            }
          }),
        ),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => context.router.popForced(),
          child: Icon(
            Icons.arrow_back,
            color: CupertinoTheme.of(context).primaryColor,
          ),
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<PlanListCubit, List<Plan>>(
            builder: (context, state) {
              if (!deleting) {
                Plan plan = state[widget.index];
                int sum = plan.ticketPrice;
                int expenses = 0;
                if (plan.hotelPrice != null) {
                  sum += plan.hotelPrice!;
                }
                if (plan.notes != null) {
                  expenses =
                      plan.notes!.fold(0, (prev, note) => prev += note.price!);
                  sum += expenses;
                }
                return Section(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: CupertinoTheme.of(context).primaryColor,
                        borderRadius: borderRadius16,
                      ),
                      padding: padding,
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/ticket.svg',
                              width: 24.r,
                              height: 24.r,
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                            Text(
                              'Total plan price',
                              style: subtitleStyle,
                            ),
                            Text(
                              '\$$sum',
                              style: titleStyle.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 20.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    CExpansionPanel(
                      title:
                          '${plan.departure.country} - ${plan.arrival.country}',
                      pretitle: 'Flight',
                      bannerTitle: 'Ticket price',
                      bannerValue: '\$${plan.ticketPrice}',
                      body: FlightBody(plan: plan),
                    ),
                    CExpansionPanel(
                      title: plan.hotelName ?? 'No hotel specified',
                      pretitle: 'Hotel',
                      bannerTitle: 'Price per day',
                      bannerValue: '\$${plan.hotelPrice}',
                      body: HotelBody(plan: plan),
                    ),
                    CExpansionPanel(
                      title: 'Your notes for the trip',
                      pretitle: 'Notes',
                      bannerTitle: 'Expenses',
                      bannerValue: '\$$expenses',
                      body: NotesBody(plan: plan),
                    ),
                  ],
                );
              } else {
                return const Center(child: CupertinoActivityIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}

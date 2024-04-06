import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_planner/app/router/router.dart';
import 'package:trip_planner/app/theme.dart';
import 'package:trip_planner/features/home/controller/plan_list_cubit.dart';
import 'package:trip_planner/features/home/domain/event/event.dart';
import 'package:trip_planner/features/home/domain/plan/plan.dart';
import 'package:trip_planner/features/plan/plan_cubit.dart';
import 'package:trip_planner/shared/util/format_date.dart';
import 'package:trip_planner/shared/layout/section.dart';
import 'package:trip_planner/shared/layout/section_with_title.dart';
import 'package:trip_planner/shared/widgets/button.dart';
import 'package:trip_planner/shared/widgets/picker.dart';
import 'package:trip_planner/shared/widgets/container.dart';
import 'package:trip_planner/shared/widgets/text_field.dart';

@RoutePage()
class ArrivalScreen extends StatefulWidget {
  final Plan? plan;
  const ArrivalScreen({super.key, this.plan});

  @override
  State<ArrivalScreen> createState() => _ArrivalScreenState();
}

class _ArrivalScreenState extends State<ArrivalScreen> {
  late TextEditingController countryC;
  late TextEditingController cityC;
  late TextEditingController airportC;
  DateTime dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    countryC = TextEditingController();
    cityC = TextEditingController();
    airportC = TextEditingController();
    if (widget.plan != null) {
      countryC.text = widget.plan!.arrival.country;
      cityC.text = widget.plan!.arrival.city;
      airportC.text = widget.plan!.arrival.airport;
      dateTime = widget.plan!.arrival.dateTime;
    }
  }

  @override
  void dispose() {
    countryC.dispose();
    cityC.dispose();
    airportC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Column(
          children: [
            const Text('Add plan'),
            Text(
              'Flight',
              style: subtitleStyle.copyWith(fontSize: 14),
            ),
          ],
        ),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => context.router.popForced(),
          child: Icon(
            Icons.arrow_back,
            color: CupertinoTheme.of(context).primaryColor,
          ),
        ),
        border: null,
      ),
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  SectionWithTitle(
                      title: 'Arrival',
                      child: Column(
                        children: [
                          CTextField(
                            placeholder: 'Country',
                            controller: countryC,
                            onChanged: (_) => setState(() {}),
                          ),
                          SizedBox(height: 8.h),
                          CTextField(
                            placeholder: 'City',
                            controller: cityC,
                            onChanged: (_) => setState(() {}),
                          ),
                          SizedBox(height: 8.h),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () => showCupertinoModalPopup(
                              context: context,
                              builder: (context) => CPicker(
                                onSave: (date) => setState(() {
                                  dateTime = date;
                                }),
                                initDate: dateTime,
                              ),
                            ),
                            child: CContainer(
                              child: Padding(
                                padding: padding,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        intl.format(dateTime),
                                        style: titleStyle,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          CTextField(
                            placeholder: 'Airport',
                            controller: airportC,
                            onChanged: (_) => setState(() {}),
                          ),
                        ],
                      )),
                  Section(
                    children: [
                      CButton(
                        title: 'Next',
                        onPressed: () {
                          if (widget.plan == null) {
                            final plan = context.read<PlanCubit>().state;
                            final arrival = Event(
                              country: countryC.text,
                              city: cityC.text,
                              dateTime: dateTime,
                              airport: airportC.text,
                            );
                            context
                                .read<PlanCubit>()
                                .set(plan.copyWith(arrival: arrival));

                            context.router.push(TicketRoute());
                          } else {
                            final index = context
                                .read<PlanListCubit>()
                                .state
                                .indexOf(widget.plan!);
                            final arrival = Event(
                              country: countryC.text,
                              city: cityC.text,
                              dateTime: dateTime,
                              airport: airportC.text,
                            );
                            context.read<PlanListCubit>().update(
                                index, widget.plan!.copyWith(arrival: arrival));
                            context.router.popForced();
                          }
                        },
                        active: countryC.text.isNotEmpty &&
                            cityC.text.isNotEmpty &&
                            airportC.text.isNotEmpty,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/app/router/router.dart';
import 'package:trip_planner/app/theme.dart';
import 'package:trip_planner/features/home/controller/plan_list_cubit.dart';
import 'package:trip_planner/features/home/domain/plan/plan.dart';
import 'package:trip_planner/features/plan/plan_cubit.dart';
import 'package:trip_planner/shared/layout/section.dart';
import 'package:trip_planner/shared/layout/section_with_title.dart';
import 'package:trip_planner/shared/widgets/button.dart';
import 'package:trip_planner/shared/widgets/text_field.dart';

@RoutePage()
class TicketScreen extends StatefulWidget {
  final Plan? plan;
  const TicketScreen({super.key, this.plan});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  late TextEditingController priceC;

  @override
  void initState() {
    super.initState();
    priceC = TextEditingController();
    if (widget.plan != null) {
      priceC.text = widget.plan!.ticketPrice.toString();
    }
  }

  @override
  void dispose() {
    priceC.dispose();
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
                    title: 'Ticket price',
                    child: CTextField(
                      placeholder: 'Price',
                      controller: priceC,
                      onChanged: (_) => setState(() {}),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Section(
                    children: [
                      CButton(
                        title: 'Next',
                        onPressed: () {
                          if (widget.plan == null) {
                            final plan = context.read<PlanCubit>().state;
                            context.read<PlanCubit>().set(plan.copyWith(
                                ticketPrice: int.parse(priceC.text)));
                            context.router.push(HotelRoute());
                          } else {
                            final index = context
                                .read<PlanListCubit>()
                                .state
                                .indexOf(widget.plan!);
                            context.read<PlanListCubit>().update(
                                index,
                                widget.plan!.copyWith(
                                    ticketPrice: int.parse(priceC.text)));
                            context.router.popForced();
                          }
                        },
                        active: priceC.text.isNotEmpty,
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

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/app/router/router.dart';
import 'package:trip_planner/features/home/domain/plan/plan.dart';
import 'package:trip_planner/features/plan/plan_cubit.dart';

class FlightDialog extends StatelessWidget {
  final Plan plan;
  const FlightDialog({
    super.key,
    required this.plan,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: const Text('What would you like to edit?'),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            context.router
              ..popForced()
              ..push(NameRoute(plan: plan));
          },
          child: const Text('Name of the plan'),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            context.router
              ..popForced()
              ..push(DepartureRoute(plan: plan));
          },
          child: const Text('Departure'),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            context.router
              ..popForced()
              ..push(ArrivalRoute(plan: plan));
          },
          child: const Text('Arrival'),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            context.router
              ..popForced()
              ..push(TicketRoute(plan: plan));
          },
          child: const Text('Ticket price'),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
          onPressed: () => context.router.popForced(),
          child: const Text('Cancel')),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/features/home/controller/plan_list_cubit.dart';

class DeleteDialog extends StatelessWidget {
  final int index;
  final Function onDelete;

  const DeleteDialog({Key? key, required this.index, required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Are you sure?'),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            context.router.popForced();
          },
          child: const Text('No'),
        ),
        CupertinoDialogAction(
          onPressed: () {
            context.read<PlanListCubit>().delete(index);
            onDelete(); // Notify parent about deletion
            context.router.popForced();
          },
          isDestructiveAction: true,
          child: const Text('Yes'),
        ),
      ],
    );
  }
}

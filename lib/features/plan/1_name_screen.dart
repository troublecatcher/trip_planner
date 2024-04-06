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
class NameScreen extends StatefulWidget {
  final Plan? plan;
  const NameScreen({super.key, this.plan});

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  late TextEditingController titleC;

  @override
  void initState() {
    super.initState();
    titleC = TextEditingController();
    if (widget.plan != null) {
      titleC.text = widget.plan!.title;
    }
  }

  @override
  void dispose() {
    titleC.dispose();
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
              'Start',
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
                    title: 'Plan name',
                    child: CTextField(
                      placeholder: 'Name',
                      controller: titleC,
                      onChanged: (_) => setState(() {}),
                      maxLines: 1,
                    ),
                  ),
                  Section(
                    children: [
                      CButton(
                        title: 'Next',
                        onPressed: () {
                          if (widget.plan == null) {
                            final plan = context.read<PlanCubit>().state;
                            context
                                .read<PlanCubit>()
                                .set(plan.copyWith(title: titleC.text));
                            context.router.push(DepartureRoute());
                          } else {
                            final index = context
                                .read<PlanListCubit>()
                                .state
                                .indexOf(widget.plan!);
                            context.read<PlanListCubit>().update(index,
                                widget.plan!.copyWith(title: titleC.text));
                            context.router.popForced();
                          }
                        },
                        active: titleC.text.isNotEmpty,
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

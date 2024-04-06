import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_planner/app/theme.dart';
import 'package:trip_planner/features/home/controller/plan_list_cubit.dart';
import 'package:trip_planner/features/home/domain/note/note.dart';
import 'package:trip_planner/features/home/domain/plan/plan.dart';
import 'package:trip_planner/features/plan/note_list_cubit.dart';
import 'package:trip_planner/features/plan/plan_cubit.dart';
import 'package:trip_planner/shared/layout/section.dart';
import 'package:trip_planner/shared/layout/section_with_title.dart';
import 'package:trip_planner/shared/layout/section_with_title_and_button.dart';
import 'package:trip_planner/shared/widgets/button.dart';
import 'package:trip_planner/shared/widgets/container.dart';
import 'package:trip_planner/shared/widgets/text_button.dart';
import 'package:trip_planner/shared/widgets/text_field.dart';

@RoutePage()
class NotesScreen extends StatefulWidget implements AutoRouteWrapper {
  final Plan? plan;
  const NotesScreen({super.key, this.plan});

  @override
  State<NotesScreen> createState() => _NotesScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteListCubit(),
      child: this,
    );
  }
}

class _NotesScreenState extends State<NotesScreen> {
  late TextEditingController descC;
  late TextEditingController priceC;

  @override
  void initState() {
    super.initState();
    descC = TextEditingController();
    priceC = TextEditingController();
    if (widget.plan != null && widget.plan!.notes != null) {
      context.read<NoteListCubit>().set(widget.plan!.notes!);
    }
  }

  @override
  void dispose() {
    descC.dispose();
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
              'Notes',
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
        trailing: widget.plan == null
            ? CTextButton(
                title: 'Skip',
                onPressed: () {
                  final plan = context.read<PlanCubit>().state;
                  context.read<PlanListCubit>().create(plan);
                  context.router.popUntilRoot();
                },
              )
            : null,
        border: null,
      ),
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Section(
                children: [
                  SectionWithTitleAndButton(
                    buttonTitle: 'Add',
                    onPressed: () {
                      if (descC.text.isNotEmpty) {
                        int price = 0;
                        if (priceC.text.isNotEmpty) {
                          price = int.parse(priceC.text);
                        }
                        context.read<NoteListCubit>().create(
                            Note(description: descC.text, price: price));
                        descC.clear();
                        priceC.clear();
                      }
                    },
                    title: 'Notes',
                    child: Column(
                      children: [
                        SizedBox(
                          height: 120.h,
                          child: CTextField(
                            placeholder: 'Title',
                            controller: descC,
                            onChanged: (_) => setState(() {}),
                            maxLines: 4,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        CTextField(
                          placeholder: 'Price',
                          controller: priceC,
                          onChanged: (_) => setState(() {}),
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'If you don’t plan to spend, you don’t have to specify a price.',
                          style: subtitleStyle,
                        ),
                        SizedBox(height: 16.h),
                      ],
                    ),
                  ),
                  BlocBuilder<NoteListCubit, List<Note>>(
                    builder: (context, state) {
                      return CButton(
                        title: 'Done',
                        onPressed: () {
                          if (widget.plan == null) {
                            final plan = context.read<PlanCubit>().state;
                            final notes = context.read<NoteListCubit>().state;
                            context
                                .read<PlanListCubit>()
                                .create(plan.copyWith(notes: notes));
                            context.router.popUntilRoot();
                          } else {
                            final index = context
                                .read<PlanListCubit>()
                                .state
                                .indexOf(widget.plan!);
                            final notes = context.read<NoteListCubit>().state;
                            context.read<PlanListCubit>().update(
                                index, widget.plan!.copyWith(notes: notes));
                            context.read<PlanCubit>().set(Plan.empty());
                            context.router.popForced();
                          }
                        },
                        active: state.isNotEmpty,
                      );
                    },
                  ),
                ],
              ),
            ),
            BlocBuilder<NoteListCubit, List<Note>>(
              builder: (context, state) {
                if (state.isNotEmpty) {
                  return SliverToBoxAdapter(
                    child: Padding(
                      padding: hpadding,
                      child: Text(
                        'Added notes – swipe to delete',
                        style: subtitleStyle,
                      ),
                    ),
                  );
                } else {
                  return const SliverToBoxAdapter(child: SizedBox.shrink());
                }
              },
            ),
            BlocBuilder<NoteListCubit, List<Note>>(
              builder: (context, state) {
                return SliverList.builder(
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    final note = state[index];
                    return Dismissible(
                      onDismissed: (_) =>
                          context.read<NoteListCubit>().remove(index),
                      key: UniqueKey(),
                      child: Section(
                        children: [
                          CContainer(
                            child: Padding(
                              padding: padding,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Description:',
                                              style: subtitleStyle,
                                            ),
                                            Text(
                                              note.description,
                                              style: titleStyle,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (note.price != 0)
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Price:',
                                                style: subtitleStyle,
                                              ),
                                              Text(
                                                '\$${note.price.toString()}',
                                                style: titleStyle,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

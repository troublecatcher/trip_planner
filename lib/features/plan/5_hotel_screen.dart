import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_planner/app/router/router.dart';
import 'package:trip_planner/app/theme.dart';
import 'package:trip_planner/features/home/controller/plan_list_cubit.dart';
import 'package:trip_planner/features/home/domain/plan/plan.dart';
import 'package:trip_planner/features/plan/plan_cubit.dart';
import 'package:trip_planner/shared/layout/section.dart';
import 'package:trip_planner/shared/layout/section_with_title.dart';
import 'package:trip_planner/shared/widgets/button.dart';
import 'package:trip_planner/shared/widgets/text_button.dart';
import 'package:trip_planner/shared/widgets/text_field.dart';

@RoutePage()
class HotelScreen extends StatefulWidget {
  final Plan? plan;
  const HotelScreen({super.key, this.plan});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  late TextEditingController nameC;
  late TextEditingController priceC;

  @override
  void initState() {
    super.initState();
    nameC = TextEditingController();
    priceC = TextEditingController();
    if (widget.plan != null && widget.plan!.hotelName != null) {
      nameC.text = widget.plan!.hotelName!;
      priceC.text = widget.plan!.hotelPrice!.toString();
    }
  }

  @override
  void dispose() {
    nameC.dispose();
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
              'Hotel',
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
                  context
                      .read<PlanCubit>()
                      .set(plan.copyWith(hotelName: '', hotelPrice: 0));
                  context.router.push(NotesRoute());
                },
              )
            : null,
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
                    title: 'Hotel',
                    child: Column(
                      children: [
                        CTextField(
                          placeholder: 'Name',
                          controller: nameC,
                          onChanged: (_) => setState(() {}),
                        ),
                        SizedBox(height: 8.h),
                        CTextField(
                          placeholder: 'Price',
                          controller: priceC,
                          onChanged: (_) => setState(() {}),
                          keyboardType: TextInputType.number,
                        ),
                      ],
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
                                hotelName: nameC.text,
                                hotelPrice: int.parse(priceC.text)));
                            context.router.push(NotesRoute());
                          } else {
                            final index = context
                                .read<PlanListCubit>()
                                .state
                                .indexOf(widget.plan!);
                            context.read<PlanListCubit>().update(
                                index,
                                widget.plan!.copyWith(
                                    hotelName: nameC.text,
                                    hotelPrice: int.parse(priceC.text)));
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

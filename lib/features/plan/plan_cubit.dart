import 'package:bloc/bloc.dart';
import 'package:trip_planner/features/home/domain/plan/plan.dart';

class PlanCubit extends Cubit<Plan> {
  PlanCubit() : super(Plan.empty());
  set(Plan plan) => emit(plan);
}

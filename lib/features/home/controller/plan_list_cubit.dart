import 'package:bloc/bloc.dart';
import 'package:trip_planner/app/main.dart';
import 'package:trip_planner/features/home/domain/plan/plan.dart';

class PlanListCubit extends Cubit<List<Plan>> {
  PlanListCubit() : super([]) {
    read();
  }

  create(Plan plan) {
    plansBox.add(plan).whenComplete(() => read());
  }

  read() {
    List<Plan> planList = [];
    if (plansBox.isNotEmpty) {
      for (var i = 0; i < plansBox.length; i++) {
        final plan = plansBox.getAt(i);
        planList.add(plan!);
      }
      emit(planList);
    } else {
      emit([]);
    }
  }

  update(int index, Plan plan) {
    plansBox.putAt(index, plan);
    read();
  }

  delete(int index) {
    plansBox.deleteAt(index);
    read();
  }
}

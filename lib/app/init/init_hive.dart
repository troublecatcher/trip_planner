import 'package:hive_flutter/hive_flutter.dart';
import 'package:trip_planner/app/main.dart';
import 'package:trip_planner/features/home/domain/event/event.dart';
import 'package:trip_planner/features/home/domain/note/note.dart';
import 'package:trip_planner/features/home/domain/plan/plan.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(EventAdapter());
  Hive.registerAdapter(NoteAdapter());
  Hive.registerAdapter(PlanAdapter());
  plansBox = await Hive.openBox('plans');
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:trip_planner/app/init/init_di.dart';
import 'package:trip_planner/app/init/init_hive.dart';
import 'package:trip_planner/app/router/router.dart';
import 'package:trip_planner/app/theme.dart';
import 'package:trip_planner/features/home/controller/plan_list_cubit.dart';
import 'package:trip_planner/features/home/domain/plan/plan.dart';
import 'package:trip_planner/features/plan/plan_cubit.dart';

final di = GetIt.instance;

late Box<Plan> plansBox;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDI();
  await initHive();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => PlanListCubit(),
      ),
      BlocProvider(
        create: (context) => PlanCubit(),
      ),
    ],
    child: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return CupertinoApp.router(
          theme: theme,
          routerConfig: _appRouter.config(),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [DefaultMaterialLocalizations.delegate],
        );
      },
    );
  }
}

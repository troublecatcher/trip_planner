import 'package:auto_route/auto_route.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trip_planner/app/main.dart';
import 'package:trip_planner/app/router/tabs_router.dart';
import 'package:trip_planner/features/home/domain/plan/plan.dart';
import 'package:trip_planner/features/home/view/layout/plans_screen.dart';
import 'package:trip_planner/features/home/view/layout/plans_wrapper_screen.dart';
import 'package:trip_planner/features/home/view/layout/single_item_screen.dart';
import 'package:trip_planner/features/plan/3_arrival_screen.dart';
import 'package:trip_planner/features/plan/2_departure_screen.dart';
import 'package:trip_planner/features/plan/5_hotel_screen.dart';
import 'package:trip_planner/features/plan/1_name_screen.dart';
import 'package:trip_planner/features/plan/6_notes_screen.dart';
import 'package:trip_planner/features/plan/4_ticket_screen.dart';
import 'package:trip_planner/features/onboarding/onboarding_screen.dart';
import 'package:trip_planner/features/settings/privacy_policy_screen.dart';
import 'package:trip_planner/features/settings/promotion_screen.dart';
import 'package:trip_planner/features/settings/settings_screen.dart';
import 'package:trip_planner/features/settings/terms_of_use_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  final firstTime = di<SharedPreferences>().getBool('isFirstTime');
  final promotion = di<FirebaseRemoteConfig>().getString("promotion");

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: OnboardingRoute.page,
          initial: firstTime != null && promotion.isEmpty,
        ),
        AutoRoute(
          page: TabBarRoute.page,
          initial: firstTime == null && promotion.isEmpty,
          children: [
            AutoRoute(
              page: PlansWrapperRoute.page,
              children: [
                AutoRoute(page: PlansRoute.page),
                AutoRoute(page: SingleItemRoute.page),
                AutoRoute(page: NameRoute.page),
                AutoRoute(page: DepartureRoute.page),
                AutoRoute(page: ArrivalRoute.page),
                AutoRoute(page: TicketRoute.page),
                AutoRoute(page: HotelRoute.page),
                AutoRoute(page: NotesRoute.page),
              ],
            ),
            AutoRoute(page: SettingsRoute.page),
          ],
        ),
        AutoRoute(page: PromotionRoute.page, initial: promotion.isNotEmpty),
        AutoRoute(page: PrivacyPolicyRoute.page),
        AutoRoute(page: TermsOfUseRoute.page),
      ];
}

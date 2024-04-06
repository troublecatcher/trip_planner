// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ArrivalRoute.name: (routeData) {
      final args = routeData.argsAs<ArrivalRouteArgs>(
          orElse: () => const ArrivalRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ArrivalScreen(
          key: args.key,
          plan: args.plan,
        ),
      );
    },
    DepartureRoute.name: (routeData) {
      final args = routeData.argsAs<DepartureRouteArgs>(
          orElse: () => const DepartureRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DepartureScreen(
          key: args.key,
          plan: args.plan,
        ),
      );
    },
    HotelRoute.name: (routeData) {
      final args = routeData.argsAs<HotelRouteArgs>(
          orElse: () => const HotelRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HotelScreen(
          key: args.key,
          plan: args.plan,
        ),
      );
    },
    NameRoute.name: (routeData) {
      final args =
          routeData.argsAs<NameRouteArgs>(orElse: () => const NameRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NameScreen(
          key: args.key,
          plan: args.plan,
        ),
      );
    },
    NotesRoute.name: (routeData) {
      final args = routeData.argsAs<NotesRouteArgs>(
          orElse: () => const NotesRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: NotesScreen(
          key: args.key,
          plan: args.plan,
        )),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    PlansRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PlansScreen(),
      );
    },
    PlansWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PlansWrapperScreen(),
      );
    },
    PrivacyPolicyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PrivacyPolicyScreen(),
      );
    },
    PromotionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PromotionScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    SingleItemRoute.name: (routeData) {
      final args = routeData.argsAs<SingleItemRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SingleItemScreen(
          key: args.key,
          index: args.index,
        ),
      );
    },
    TabBarRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TabBarScreen(),
      );
    },
    TermsOfUseRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TermsOfUseScreen(),
      );
    },
    TicketRoute.name: (routeData) {
      final args = routeData.argsAs<TicketRouteArgs>(
          orElse: () => const TicketRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TicketScreen(
          key: args.key,
          plan: args.plan,
        ),
      );
    },
  };
}

/// generated route for
/// [ArrivalScreen]
class ArrivalRoute extends PageRouteInfo<ArrivalRouteArgs> {
  ArrivalRoute({
    Key? key,
    Plan? plan,
    List<PageRouteInfo>? children,
  }) : super(
          ArrivalRoute.name,
          args: ArrivalRouteArgs(
            key: key,
            plan: plan,
          ),
          initialChildren: children,
        );

  static const String name = 'ArrivalRoute';

  static const PageInfo<ArrivalRouteArgs> page =
      PageInfo<ArrivalRouteArgs>(name);
}

class ArrivalRouteArgs {
  const ArrivalRouteArgs({
    this.key,
    this.plan,
  });

  final Key? key;

  final Plan? plan;

  @override
  String toString() {
    return 'ArrivalRouteArgs{key: $key, plan: $plan}';
  }
}

/// generated route for
/// [DepartureScreen]
class DepartureRoute extends PageRouteInfo<DepartureRouteArgs> {
  DepartureRoute({
    Key? key,
    Plan? plan,
    List<PageRouteInfo>? children,
  }) : super(
          DepartureRoute.name,
          args: DepartureRouteArgs(
            key: key,
            plan: plan,
          ),
          initialChildren: children,
        );

  static const String name = 'DepartureRoute';

  static const PageInfo<DepartureRouteArgs> page =
      PageInfo<DepartureRouteArgs>(name);
}

class DepartureRouteArgs {
  const DepartureRouteArgs({
    this.key,
    this.plan,
  });

  final Key? key;

  final Plan? plan;

  @override
  String toString() {
    return 'DepartureRouteArgs{key: $key, plan: $plan}';
  }
}

/// generated route for
/// [HotelScreen]
class HotelRoute extends PageRouteInfo<HotelRouteArgs> {
  HotelRoute({
    Key? key,
    Plan? plan,
    List<PageRouteInfo>? children,
  }) : super(
          HotelRoute.name,
          args: HotelRouteArgs(
            key: key,
            plan: plan,
          ),
          initialChildren: children,
        );

  static const String name = 'HotelRoute';

  static const PageInfo<HotelRouteArgs> page = PageInfo<HotelRouteArgs>(name);
}

class HotelRouteArgs {
  const HotelRouteArgs({
    this.key,
    this.plan,
  });

  final Key? key;

  final Plan? plan;

  @override
  String toString() {
    return 'HotelRouteArgs{key: $key, plan: $plan}';
  }
}

/// generated route for
/// [NameScreen]
class NameRoute extends PageRouteInfo<NameRouteArgs> {
  NameRoute({
    Key? key,
    Plan? plan,
    List<PageRouteInfo>? children,
  }) : super(
          NameRoute.name,
          args: NameRouteArgs(
            key: key,
            plan: plan,
          ),
          initialChildren: children,
        );

  static const String name = 'NameRoute';

  static const PageInfo<NameRouteArgs> page = PageInfo<NameRouteArgs>(name);
}

class NameRouteArgs {
  const NameRouteArgs({
    this.key,
    this.plan,
  });

  final Key? key;

  final Plan? plan;

  @override
  String toString() {
    return 'NameRouteArgs{key: $key, plan: $plan}';
  }
}

/// generated route for
/// [NotesScreen]
class NotesRoute extends PageRouteInfo<NotesRouteArgs> {
  NotesRoute({
    Key? key,
    Plan? plan,
    List<PageRouteInfo>? children,
  }) : super(
          NotesRoute.name,
          args: NotesRouteArgs(
            key: key,
            plan: plan,
          ),
          initialChildren: children,
        );

  static const String name = 'NotesRoute';

  static const PageInfo<NotesRouteArgs> page = PageInfo<NotesRouteArgs>(name);
}

class NotesRouteArgs {
  const NotesRouteArgs({
    this.key,
    this.plan,
  });

  final Key? key;

  final Plan? plan;

  @override
  String toString() {
    return 'NotesRouteArgs{key: $key, plan: $plan}';
  }
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PlansScreen]
class PlansRoute extends PageRouteInfo<void> {
  const PlansRoute({List<PageRouteInfo>? children})
      : super(
          PlansRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlansRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PlansWrapperScreen]
class PlansWrapperRoute extends PageRouteInfo<void> {
  const PlansWrapperRoute({List<PageRouteInfo>? children})
      : super(
          PlansWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlansWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PrivacyPolicyScreen]
class PrivacyPolicyRoute extends PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<PageRouteInfo>? children})
      : super(
          PrivacyPolicyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyPolicyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PromotionScreen]
class PromotionRoute extends PageRouteInfo<void> {
  const PromotionRoute({List<PageRouteInfo>? children})
      : super(
          PromotionRoute.name,
          initialChildren: children,
        );

  static const String name = 'PromotionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SingleItemScreen]
class SingleItemRoute extends PageRouteInfo<SingleItemRouteArgs> {
  SingleItemRoute({
    Key? key,
    required int index,
    List<PageRouteInfo>? children,
  }) : super(
          SingleItemRoute.name,
          args: SingleItemRouteArgs(
            key: key,
            index: index,
          ),
          initialChildren: children,
        );

  static const String name = 'SingleItemRoute';

  static const PageInfo<SingleItemRouteArgs> page =
      PageInfo<SingleItemRouteArgs>(name);
}

class SingleItemRouteArgs {
  const SingleItemRouteArgs({
    this.key,
    required this.index,
  });

  final Key? key;

  final int index;

  @override
  String toString() {
    return 'SingleItemRouteArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [TabBarScreen]
class TabBarRoute extends PageRouteInfo<void> {
  const TabBarRoute({List<PageRouteInfo>? children})
      : super(
          TabBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'TabBarRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TermsOfUseScreen]
class TermsOfUseRoute extends PageRouteInfo<void> {
  const TermsOfUseRoute({List<PageRouteInfo>? children})
      : super(
          TermsOfUseRoute.name,
          initialChildren: children,
        );

  static const String name = 'TermsOfUseRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TicketScreen]
class TicketRoute extends PageRouteInfo<TicketRouteArgs> {
  TicketRoute({
    Key? key,
    Plan? plan,
    List<PageRouteInfo>? children,
  }) : super(
          TicketRoute.name,
          args: TicketRouteArgs(
            key: key,
            plan: plan,
          ),
          initialChildren: children,
        );

  static const String name = 'TicketRoute';

  static const PageInfo<TicketRouteArgs> page = PageInfo<TicketRouteArgs>(name);
}

class TicketRouteArgs {
  const TicketRouteArgs({
    this.key,
    this.plan,
  });

  final Key? key;

  final Plan? plan;

  @override
  String toString() {
    return 'TicketRouteArgs{key: $key, plan: $plan}';
  }
}

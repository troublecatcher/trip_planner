import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trip_planner/app/router/router.dart';
import 'package:trip_planner/app/theme.dart';

@RoutePage()
class TabBarScreen extends StatelessWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final activeColor = CupertinoTheme.of(context).primaryColor;
    const inactiveColor = Color.fromRGBO(245, 245, 245, 0.4);
    return AutoTabsScaffold(
      backgroundColor: CupertinoTheme.of(context).scaffoldBackgroundColor,
      routes: const [
        PlansRoute(),
        SettingsRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return CupertinoTabBar(
          border: null,
          backgroundColor: const Color.fromRGBO(36, 36, 36, 1),
          activeColor: activeColor,
          currentIndex: tabsRouter.activeIndex,
          onTap: (value) {
            tabsRouter.setActiveIndex(value);
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/plans.svg',
                colorFilter: const ColorFilter.mode(
                  inactiveColor,
                  BlendMode.srcIn,
                ),
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/plans.svg',
                colorFilter: ColorFilter.mode(
                  activeColor,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Plans',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/settings.svg',
                colorFilter: const ColorFilter.mode(
                  inactiveColor,
                  BlendMode.srcIn,
                ),
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/settings.svg',
                colorFilter: ColorFilter.mode(
                  activeColor,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Settings',
            ),
          ],
        );
      },
    );
  }
}

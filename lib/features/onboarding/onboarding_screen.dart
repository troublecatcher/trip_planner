import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trip_planner/app/router/router.dart';
import 'package:trip_planner/shared/widgets/button.dart';
import 'package:trip_planner/app/main.dart';
import 'package:trip_planner/app/theme.dart';

@RoutePage()
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
          child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/onboarding.png',
                width: MediaQuery.of(context).size.width / 1.5,
              ),
              Text(
                'Maximize your trip With our app!',
                style: titleStyle.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 32.sp,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Booking, route planning, and expense tracking - all in one place!',
                style: subtitleStyle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: hpadding,
                child: CButton(
                  title: 'Get started',
                  onPressed: () {
                    di<SharedPreferences>().remove('isFirstTime');
                    context.router.replace(const PlansRoute());
                  },
                  active: true,
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoButton(
                    child: Text(
                      'Terms of Use',
                      style:
                          subtitleStyle.copyWith(fontWeight: FontWeight.w400),
                    ),
                    onPressed: () => context.router.push(
                      const TermsOfUseRoute(),
                    ),
                  ),
                  Text(
                    ' / ',
                    style: subtitleStyle.copyWith(fontWeight: FontWeight.w400),
                  ),
                  CupertinoButton(
                    child: Text(
                      'Privacy Policy',
                      style:
                          subtitleStyle.copyWith(fontWeight: FontWeight.w400),
                    ),
                    onPressed: () => context.router.push(
                      const PrivacyPolicyRoute(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      )),
    );
  }
}

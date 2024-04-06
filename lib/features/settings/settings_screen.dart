import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:trip_planner/app/router/router.dart';
import 'package:trip_planner/features/settings/settings_item.dart';
import 'package:trip_planner/shared/layout/section.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool shareable = true;
    return CupertinoPageScaffold(
      child: SafeArea(
          child: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(
            largeTitle: Text('Settings'),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Section(
              children: [
                SettingsItem(
                  title: 'Share with friends',
                  iconAssetPath: 'assets/icons/share.svg',
                  onPressed: (ctx) async {
                    if (shareable) {
                      shareable = false;
                      final box = ctx.findRenderObject() as RenderBox?;
                      await Share.shareWithResult(
                              'Check out this trip planner!',
                              sharePositionOrigin:
                                  box!.localToGlobal(Offset.zero) & box.size)
                          .whenComplete(() => shareable = true);
                    }
                  },
                ),
                SizedBox(height: 8.h),
                SettingsItem(
                  title: 'Terms of use',
                  iconAssetPath: 'assets/icons/terms.svg',
                  onPressed: (_) =>
                      context.router.push(const TermsOfUseRoute()),
                ),
                SizedBox(height: 8.h),
                SettingsItem(
                  title: 'Privacy Policy',
                  iconAssetPath: 'assets/icons/privacy.svg',
                  onPressed: (_) =>
                      context.router.push(const PrivacyPolicyRoute()),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

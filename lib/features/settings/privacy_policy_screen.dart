import 'package:auto_route/auto_route.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:trip_planner/app/main.dart';

@RoutePage()
class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final privacyPolicy =
        di<FirebaseRemoteConfig>().getString("privacy_policy");
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Privacy Policy'),
      ),
      child: SafeArea(
        bottom: false,
        child: Builder(
          builder: (context) {
            if (privacyPolicy != '') {
              return InAppWebView(
                initialUrlRequest: URLRequest(
                  url: WebUri(privacyPolicy),
                ),
              );
            } else {
              return const Center(
                child: Text('Failed to load privacy policy'),
              );
            }
          },
        ),
      ),
    );
  }
}

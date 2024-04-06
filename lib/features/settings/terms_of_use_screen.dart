import 'package:auto_route/auto_route.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:trip_planner/app/main.dart';

@RoutePage()
class TermsOfUseScreen extends StatelessWidget {
  const TermsOfUseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final termsOfUse = di<FirebaseRemoteConfig>().getString("terms_of_use");
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Terms of Use'),
      ),
      child: SafeArea(
        bottom: false,
        child: Builder(
          builder: (context) {
            if (termsOfUse != '') {
              return InAppWebView(
                initialUrlRequest: URLRequest(
                  url: WebUri(termsOfUse),
                ),
              );
            } else {
              return const Center(
                child: Text('Failed to load terms of use'),
              );
            }
          },
        ),
      ),
    );
  }
}

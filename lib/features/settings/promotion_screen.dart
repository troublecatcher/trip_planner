import 'package:auto_route/auto_route.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:trip_planner/app/main.dart';

@RoutePage()
class PromotionScreen extends StatelessWidget {
  const PromotionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final promotion = di<FirebaseRemoteConfig>().getString("promotion");
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Promotion')),
      child: SafeArea(
        bottom: false,
        child: Builder(
          builder: (context) {
            if (promotion != '') {
              return InAppWebView(
                initialUrlRequest: URLRequest(
                  url: WebUri(promotion),
                ),
              );
            } else {
              return const Center(
                child: Text('Failed to load promotion'),
              );
            }
          },
        ),
      ),
    );
  }
}

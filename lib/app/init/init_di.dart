import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trip_planner/app/init/firebase_options.dart';
import 'package:trip_planner/app/main.dart';

Future<void> initDI() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  di.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  if (await IsFirstRun.isFirstRun()) {
    await di<SharedPreferences>().setBool('isFirstTime', true);
  }

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 25),
    minimumFetchInterval: const Duration(seconds: 25),
  ));
  await remoteConfig.fetchAndActivate();
  di.registerLazySingleton<FirebaseRemoteConfig>(() => remoteConfig);
}

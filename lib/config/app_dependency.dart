import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

import '../core/constants/constants.dart';
import '../core/preferences/app_preference.dart';

final di = GetIt.instance;

Future<void> initDependencies() async {
  await Hive.openBox(Constants.preferenceKey);
  final box = Hive.box(Constants.preferenceKey);
  di.registerLazySingleton(() => AppPreferences(box: box));

  // di.registerSingleton<MainRepository>(MainRepositoryImpl());
}

// final hadithRepository = di.get<MainRepository>();

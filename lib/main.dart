import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'src/common/view_models/theme_view_model.dart';
import 'src/core/exports/constants_exports.dart';
import 'src/core/services/locator/locator_service.dart';
import 'src/core/services/navigation/navigation_route.dart';
import 'src/core/services/navigation/navigation_service.dart';

void main() async {
  setupLocator();
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    MultiProvider(
      providers: AppConstants.defaultProviders,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        title: AppConstants.appName,
        theme: ThemeConstants.lightTheme,
        darkTheme: ThemeConstants.darkTheme,
        debugShowCheckedModeBanner: false,
        themeMode: context.watch<ThemeViewModel>().themeMode,
        initialRoute: NavigationConstants.home,
        onGenerateRoute: NavigationRoute.instance.generateRoute,
        navigatorKey: NavigationService.instance.navigatorKey,
      ),
    );
  }
}

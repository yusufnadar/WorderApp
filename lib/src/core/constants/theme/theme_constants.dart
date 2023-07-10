import 'package:flutter/material.dart';

import '../../exports/constants_exports.dart';

// Uygulamadaki temaların renklerinin belirlendiği kısım
class ThemeConstants {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorConstants.lightGrey,
    fontFamily: AppConstants.fontFamily,
    appBarTheme: const AppBarTheme(
      color: ColorConstants.primary,
    ),
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorConstants.lightGrey,
    fontFamily: AppConstants.fontFamily,
    appBarTheme: const AppBarTheme(
      color: ColorConstants.primary,
    ),
  );
}

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../common/view_models/theme_view_model.dart';
import '../../../pages/home/view_model/home_view_model.dart';

// Uygulamayla ilgili temel veriler
class AppConstants {
  static const appName = 'Worder';
  static final fontFamily = GoogleFonts.poppins().fontFamily;

  static final defaultProviders = [
    ChangeNotifierProvider<ThemeViewModel>(
      create: (context) => ThemeViewModel(),
    ),
    ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(),
    ),
  ];
}

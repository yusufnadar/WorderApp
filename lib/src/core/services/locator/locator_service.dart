import 'package:get_it/get_it.dart';

import '../../../pages/favorites/view_model/favorites_view_model.dart';
import '../../../pages/home/view_model/home_view_model.dart';

final GetIt locator = GetIt.instance;

void setupLocator(){
  locator.registerFactory<HomeViewModel>(() => HomeViewModel());
  locator.registerFactory<FavoritesViewModel>(() => FavoritesViewModel());
}
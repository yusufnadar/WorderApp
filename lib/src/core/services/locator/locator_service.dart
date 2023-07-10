import 'package:get_it/get_it.dart';
import '../../../pages/favorites/viewModel/favorites_view_model.dart';
import '../../../pages/home/viewModel/home_view_model.dart';

final GetIt locator = GetIt.instance;

void setupLocator(){
  locator.registerFactory<HomeViewModel>(() => HomeViewModel());
  locator.registerFactory<FavoritesViewModel>(() => FavoritesViewModel());
}
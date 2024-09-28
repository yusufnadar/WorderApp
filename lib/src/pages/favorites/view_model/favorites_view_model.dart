import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/models/words_model.dart';
import '../../../core/base/view_model/base_view_model.dart';
import '../../../core/services/database_helper/database_helper_service.dart';
import '../../../core/services/navigation/navigation_service.dart';
import '../../home/view_model/home_view_model.dart';

class FavoritesViewModel extends ChangeNotifier with BaseViewModel {
  final databaseHelperService = DatabaseHelperService.instance;

  var favorites = <WordsModel>[];
  var tempFavorites = <WordsModel>[];

  final focusNode = FocusNode();

  bool isFocus = false;

  Future<void> onModelReady() async {
    await getFavorites();
  }

  Future<void> getFavorites() async {
    var res = await databaseHelperService.getFavorites();
    if (res != null) {
      favorites = res;
      tempFavorites = res;
      notifyListeners();
    }
  }

  Future addOrDeleteFavourite(WordsModel item) async {
    final model = Provider.of<HomeViewModel>(
      NavigationService.instance.navigatorKey.currentContext!,
      listen: false,
    );
    var res = await databaseHelperService.addOrDeleteFavourite(item);
    if (res == true) {
      if (item.favorite == true) {
        item.favorite = false;
        model.changeFavoriteFalse(item);
      } else {
        item.favorite = true;
        model.changeFavoriteTrue(item);
      }
      notifyListeners();
    }
  }

  void changeFocus(value) {
    isFocus = value;
    notifyListeners();
    if (isFocus == true) {
      focusNode.requestFocus();
      tempFavorites = favorites;
      notifyListeners();
    } else {
      focusNode.unfocus();
    }
  }

  Future searchWord(String value) async {
    final lowercaseValue = value.toLowerCase();
    tempFavorites =
        favorites.where((item) => item.word!.toLowerCase().startsWith(lowercaseValue)).toList();
    notifyListeners();
  }
}

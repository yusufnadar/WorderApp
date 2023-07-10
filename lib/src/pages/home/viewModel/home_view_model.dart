import 'package:flutter/material.dart';
import '../../../common/models/words_model.dart';
import '../../../core/base/viewModel/base_view_model.dart';
import '../../../core/services/databaseHelper/database_helper_service.dart';
import '../../../core/services/navigation/navigation_service.dart';

class HomeViewModel extends ChangeNotifier with BaseViewModel {
  final databaseHelperService = DatabaseHelperService.instance;

  var words = <WordsModel>[];
  var tempWords = <WordsModel>[];

  final wordController = TextEditingController();
  final meaningController = TextEditingController();

  final addWordKey = GlobalKey<FormState>();
  final updateWordKey = GlobalKey<FormState>();

  final focusNode = FocusNode();
  bool isFocus = false;

  int filterType = 1;

  void changeFilterType(value) {
    filterType = value;
    notifyListeners();
  }

  void clearTexts() {
    wordController.clear();
    meaningController.clear();
  }

  void fillTexts(WordsModel item) {
    wordController.text = item.word!;
    meaningController.text = item.meaning!;
  }

  void onModelReady() async {
    getWords();
  }

  Future<void> getWords() async {
    String filter = '';
    switch (filterType) {
      case 1:
        filter = 'ORDER BY id desc';
        break;
      case 2:
        filter = 'ORDER BY id asc';
        break;
      case 3:
        filter = 'ORDER BY word asc';
        break;
      case 4:
        filter = 'ORDER BY word desc';
        break;
      default:
        filter = 'ORDER BY id asc';
    }
    var res = await databaseHelperService.getWords(filter);
    if (res != null) {
      words = res;
      tempWords = res;
      notifyListeners();
    }
  }

  Future<void> addWord() async {
    if (addWordKey.currentState!.validate()) {
      var res = await databaseHelperService.addWord(
        wordController.text,
        meaningController.text,
      );
      if (res != false) {
        words.insert(
          0,
          WordsModel(
            id: res,
            word: wordController.text,
            meaning: meaningController.text,
          ),
        );
        notifyListeners();
        NavigationService.instance.navigateToBack();
      }
    }
  }

  Future<void> deleteWord(id) async {
    var res = await databaseHelperService.deleteWord(id);
    if (res != false) {
      words.removeWhere((element) => element.id == id);
      notifyListeners();
      NavigationService.instance.navigateToBack();
    }
  }

  Future<void> editWord(id, index) async {
    if (updateWordKey.currentState!.validate()) {
      var res = await databaseHelperService.editWord(
        id,
        wordController.text,
        meaningController.text,
      );
      if (res != false) {
        words[index] = words[index].copyWith(
          word: wordController.text,
          meaning: meaningController.text,
        );
        notifyListeners();
        NavigationService.instance.navigateToBack();
      }
    }
  }

  Future addOrDeleteFavourite(WordsModel item) async {
    var res = await databaseHelperService.addOrDeleteFavourite(item);
    if (res == true) {
      if (item.favorite == true) {
        item.favorite = false;
      } else {
        item.favorite = true;
      }
      notifyListeners();
    }
  }

  void changeFocus(value) {
    isFocus = value;
    notifyListeners();
    if (isFocus == true) {
      focusNode.requestFocus();
      tempWords = words;
      notifyListeners();
    } else {
      focusNode.unfocus();
    }
  }

  Future searchWord(String value) async {
    final lowercaseValue = value.toLowerCase();
    tempWords = words.where((item) => item.word!.toLowerCase().startsWith(lowercaseValue)).toList();
    notifyListeners();
  }

  void changeFavoriteFalse(WordsModel item) {
    words.firstWhere((element) => element == item).favorite = false;
    notifyListeners();
  }

  void changeFavoriteTrue(WordsModel item) {
    words.firstWhere((element) => element == item).favorite = true;
    notifyListeners();
  }
}

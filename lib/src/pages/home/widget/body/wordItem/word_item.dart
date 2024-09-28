import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../common/models/words_model.dart';
import '../../../../../core/exports/constants_exports.dart';
import '../../../view_model/home_view_model.dart';
import 'word_meaning.dart';
import 'word_popup.dart';
import 'word_title.dart';

class WordItem extends StatelessWidget {
  final WordsModel item;
  final int index;

  const WordItem({
    Key? key,
    required this.item,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeViewModel>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ColorConstants.white,
      ),
      margin: EdgeInsets.only(
        bottom: context.height * 0.01,
      ),
      padding: EdgeInsets.symmetric(
        vertical: context.height * 0.01,
        horizontal: context.width * 0.04,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WordTitle(title: item.word ?? ''),
                WordMeaning(meaning: item.meaning ?? ''),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: context.width * 0.02),
            child: GestureDetector(
              onTap: () => model.addOrDeleteFavourite(item),
              child: Image.asset(
                IconConstants.favorites,
                width: context.width * 0.05,
                color: item.favorite == true ? ColorConstants.yellow : ColorConstants.normalGrey,
              ),
            ),
          ),
          WordPopup(index: index, item: item),
        ],
      ),
    );
  }
}

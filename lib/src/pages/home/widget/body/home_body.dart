import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../src/core/exports/constants_exports.dart';
import '../../../../common/widgets/custom_word_length.dart';
import '../../view_model/home_view_model.dart';
import 'wordItem/word_item.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeViewModel>(context);
    if (model.isFocus == false) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: model.words.length,
        padding: EdgeInsets.symmetric(
          vertical: context.height * 0.02,
          horizontal: context.width * 0.04,
        ),
        itemBuilder: (context, index) => WordItem(
          item: model.words[index],
          index: index,
        ),
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomWordLength(length: model.tempWords.length),
          ListView.builder(
            shrinkWrap: true,
            itemCount: model.tempWords.length,
            padding: EdgeInsets.symmetric(
              vertical: context.height * 0.02,
              horizontal: context.width * 0.04,
            ),
            itemBuilder: (context, index) => WordItem(
              item: model.tempWords[index],
              index: index,
            ),
          ),
        ],
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../src/core/exports/constants_exports.dart';
import '../../../../common/widgets/custom_word_length.dart';
import '../../view_model/favorites_view_model.dart';
import 'favorite_item.dart';

class FavoritesBody extends StatelessWidget {
  const FavoritesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<FavoritesViewModel>(context);
    if (model.isFocus == false) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomWordLength(length: model.favorites.length),
          ListView.builder(
            shrinkWrap: true,
            itemCount: model.favorites.length,
            padding: EdgeInsets.symmetric(
              vertical: context.height * 0.02,
              horizontal: context.width * 0.04,
            ),
            itemBuilder: (context, index) => FavoriteItem(
              item: model.favorites[index],
            ),
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomWordLength(length: model.tempFavorites.length),
          ListView.builder(
            shrinkWrap: true,
            itemCount: model.tempFavorites.length,
            padding: EdgeInsets.symmetric(
              vertical: context.height * 0.02,
              horizontal: context.width * 0.04,
            ),
            itemBuilder: (context, index) => FavoriteItem(
              item: model.tempFavorites[index],
            ),
          ),
        ],
      );
    }
  }
}

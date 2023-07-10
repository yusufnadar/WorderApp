import '../../../../../src/core/exports/constants_exports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewModel/favorites_view_model.dart';
import 'favorite_item.dart';

class FavoritesBody extends StatelessWidget {
  const FavoritesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<FavoritesViewModel>(context);
    if (model.isFocus == false) {
      return ListView.builder(
        itemCount: model.favorites.length,
        padding: EdgeInsets.symmetric(
          vertical: context.height * 0.02,
          horizontal: context.width * 0.04,
        ),
        itemBuilder: (context, index) => FavoriteItem(
          item: model.favorites[index],
        ),
      );
    } else {
      return ListView.builder(
        itemCount: model.tempFavorites.length,
        padding: EdgeInsets.symmetric(
          vertical: context.height * 0.02,
          horizontal: context.width * 0.04,
        ),
        itemBuilder: (context, index) => FavoriteItem(
          item: model.tempFavorites[index],
        ),
      );
    }
  }
}

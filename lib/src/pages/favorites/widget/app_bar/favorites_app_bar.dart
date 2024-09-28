import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../src/core/exports/constants_exports.dart';
import '../../../../common/widgets/custom_word_length.dart';
import '../../../../common/widgets/search_input.dart';
import '../../../home/widget/app_bar/app_bar_title.dart';
import '../../view_model/favorites_view_model.dart';
import 'favorites_search.dart';

class FavoritesAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;

  const FavoritesAppBar({Key? key, required this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<FavoritesViewModel>(context);
    return AppBar(
      titleSpacing: 0,
      centerTitle: false,
      actions: const [
        FavoritesSearch(),
      ],
      iconTheme: const IconThemeData(
        color: ColorConstants.white,
      ),
      title: model.isFocus == false ? buildNotFocus() : buildFocus(model),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: CustomWordLength(length: model.favorites.length),
      ),
    );
  }

  SearchInput buildFocus(FavoritesViewModel model) {
    return SearchInput(
      focusNode: model.focusNode,
      onChanged: (value) => model.searchWord(value),
      onTap: () => model.changeFocus(false),
    );
  }

  AppBarTitle buildNotFocus() {
    return const AppBarTitle(title: 'Favorites');
  }

  @override
  Size get preferredSize => Size.fromHeight(context.height * 0.11);
}

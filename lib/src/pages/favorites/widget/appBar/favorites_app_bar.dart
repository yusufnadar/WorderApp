import '../../../../../src/core/exports/constants_exports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../common/widgets/search_input.dart';
import '../../../home/widget/appBar/app_bar_title.dart';
import '../../viewModel/favorites_view_model.dart';
import 'favorites_search.dart';

class FavoritesAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;

  const FavoritesAppBar({Key? key, required this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<FavoritesViewModel>(context);
    return AppBar(
      centerTitle: true,
      actions: const [FavoritesSearch()],
      title: model.isFocus == false ? buildNotFocus() : buildFocus(model),
    );
  }

  SearchInput buildFocus(FavoritesViewModel model) {
    return SearchInput(
      focusNode: model.focusNode,
      onChanged: (value) => model.searchWord(value),
      onTap: () => model.changeFocus(),
    );
  }

  AppBarTitle buildNotFocus() {
    return const AppBarTitle(title: 'Favorites');
  }

  @override
  Size get preferredSize => Size.fromHeight(context.height * 0.07);
}

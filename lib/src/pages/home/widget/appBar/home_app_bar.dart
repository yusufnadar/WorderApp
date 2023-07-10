import '../../../../../src/core/exports/constants_exports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../common/widgets/search_input.dart';
import '../../viewModel/home_view_model.dart';
import 'app_bar_title.dart';
import 'favorites_button.dart';
import 'filterButton/filter_button.dart';
import 'search_button.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;

  const HomeAppBar({Key? key, required this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeViewModel>(context);
    return AppBar(
      titleSpacing: 0,
      title: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.04,
        ),
        child: model.isFocus == false ? buildNotFocus() : buildFocus(model),
      ),
    );
  }

  SearchInput buildFocus(HomeViewModel model) {
    return SearchInput(
      focusNode: model.focusNode,
      onChanged: (value) => model.searchWord(value),
      onTap: () => model.changeFocus(false),
    );
  }

  Row buildNotFocus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const AppBarTitle(),
        buildFavoriteFilterAndSearch(),
      ],
    );
  }

  Row buildFavoriteFilterAndSearch() {
    return const Row(
      children: [
        FavoritesButton(),
        FilterButton(),
        SearchButton(),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(context.height * 0.07);
}

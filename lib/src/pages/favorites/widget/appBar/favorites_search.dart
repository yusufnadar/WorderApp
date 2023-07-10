import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/exports/constants_exports.dart';
import '../../viewModel/favorites_view_model.dart';

class FavoritesSearch extends StatelessWidget {
  const FavoritesSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<FavoritesViewModel>(context);
    return Padding(
      padding: EdgeInsets.only(right: context.width * 0.04),
      child: GestureDetector(
        onTap: () => model.changeFocus(),
        child: Image.asset(
          IconConstants.search,
          width: context.width * 0.06,
          color: ColorConstants.white,
        ),
      ),
    );
  }
}

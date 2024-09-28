import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/exports/constants_exports.dart';
import '../../view_model/home_view_model.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeViewModel>(context);
    return GestureDetector(
      onTap: () => model.changeFocus(true),
      child: Image.asset(
        IconConstants.search,
        width: context.width * 0.06,
        color: ColorConstants.white,
      ),
    );
  }
}

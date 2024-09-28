import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/text_styles/text_style_constants.dart';
import '../../../../core/exports/constants_exports.dart';
import '../../view_model/home_view_model.dart';
import 'add_dialog.dart';

class FloatingAddButton extends StatelessWidget {
  const FloatingAddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeViewModel>(context);
    return FloatingActionButton.extended(
      onPressed: () {
        model.clearTexts();
        model.changeFocus(false);
        showDialog(
          context: context,
          builder: (_) => AddDialog(context: context),
        );
      },
      backgroundColor: ColorConstants.primary,
      label: Text(
        'New Word',
        style: TextStyleConstants.semiBoldStyle(
          fontSize: context.width * 0.045,
          color: ColorConstants.white,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/exports/constants_exports.dart';
import '../../viewModel/home_view_model.dart';
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
          fontSize: 16,
          color: ColorConstants.white
        ),
      ),
    );
  }
}

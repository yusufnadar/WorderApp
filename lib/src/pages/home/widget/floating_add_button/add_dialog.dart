import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/widgets/custom_alert_button.dart';
import '../../../../common/widgets/custom_alert_dialog.dart';
import '../../../../common/widgets/custom_input.dart';
import '../../../../core/exports/constants_exports.dart';
import '../../../../core/services/navigation/navigation_service.dart';
import '../../view_model/home_view_model.dart';

class AddDialog extends StatelessWidget {
  final BuildContext context;

  const AddDialog({Key? key, required this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeViewModel>(this.context);
    return Form(
      key: model.addWordKey,
      child: CustomAlertDialog(
        title: 'New Word',
        actions: [
          CustomAlertButton(
            title: 'Cancel',
            onTap: () => NavigationService.instance.navigateToBack(),
            backgroundColor: ColorConstants.darkGrey,
          ),
          CustomAlertButton(
            title: 'Save',
            onTap: () => model.addWord(),
          )
        ],
        children: [
          CustomInput(
            hintText: 'Word',
            controller: model.wordController,
          ),
          SizedBox(height: context.height * 0.02),
          CustomInput(
            hintText: 'Meaning',
            controller: model.meaningController,
          ),
        ],
      ),
    );
  }
}

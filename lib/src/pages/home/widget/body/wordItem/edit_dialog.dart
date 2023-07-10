import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../common/widgets/custom_alert_button.dart';
import '../../../../../common/widgets/custom_alert_dialog.dart';
import '../../../../../common/widgets/custom_input.dart';
import '../../../../../core/exports/constants_exports.dart';
import '../../../../../core/services/navigation/navigation_service.dart';
import '../../../viewModel/home_view_model.dart';

class EditDialog extends StatelessWidget {
  final int id;
  final int index;
  final BuildContext context;

  const EditDialog({
    Key? key,
    required this.id,
    required this.index,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeViewModel>(this.context);
    return Form(
      key: model.updateWordKey,
      child: CustomAlertDialog(
        title: 'Update Word',
        actions: [
          CustomAlertButton(
            title: 'Cancel',
            onTap: () => NavigationService.instance.navigateToBack(),
            backgroundColor: ColorConstants.darkGrey,
          ),
          CustomAlertButton(
            title: 'Edit',
            onTap: () => model.editWord(id,index),
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

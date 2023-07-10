import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../common/widgets/custom_alert_button.dart';
import '../../../../../common/widgets/custom_alert_dialog.dart';
import '../../../../../core/exports/constants_exports.dart';
import '../../../../../core/services/navigation/navigation_service.dart';
import '../../../viewModel/home_view_model.dart';

class DeleteDialog extends StatelessWidget {
  final int id;
  final BuildContext context;

  const DeleteDialog({Key? key, required this.id, required this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeViewModel>(this.context);
    return CustomAlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      title: 'Are you sure you want to delete?',
      actions: [
        CustomAlertButton(
          backgroundColor: ColorConstants.darkGrey,
          title: 'Cancel',
          onTap: () => NavigationService.instance.navigateToBack(),
        ),
        CustomAlertButton(
          title: 'Delete',
          onTap: () => model.deleteWord(id),
        ),
      ],
      children: const [],
    );
  }
}

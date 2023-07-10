import 'package:english_words/src/pages/home/viewModel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../common/widgets/custom_alert_button.dart';
import '../../../../../common/widgets/custom_alert_dialog.dart';
import '../../../../../core/exports/constants_exports.dart';
import '../../../../../core/services/navigation/navigation_service.dart';
import 'filter_radio_list.dart';

class FilterDialog extends StatelessWidget {
  const FilterDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeViewModel>(context);
    return CustomAlertDialog(
      title: 'Sort Words',
      actions: [
        CustomAlertButton(
          title: 'Cancel',
          onTap: () => NavigationService.instance.navigateToBack(),
          backgroundColor: ColorConstants.darkGrey,
        ),
        CustomAlertButton(
          title: 'Save',
          onTap: () async{
            await model.getWords();
            NavigationService.instance.navigateToBack();
          },
        ),
      ],
      children: const [
        FilterRadioList(
          value: 1,
          title: 'Sort Newest to Oldest',
        ),
        FilterRadioList(
          value: 2,
          title: 'Sort Oldest to Newest',
        ),
        FilterRadioList(
          value: 3,
          title: 'Sort A to Z',
        ),
        FilterRadioList(
          value: 4,
          title: 'Sort Z to A',
        ),
      ],
    );
  }
}

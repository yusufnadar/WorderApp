import 'package:english_words/src/core/exports/constants_exports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/text_styles/text_style_constants.dart';
import '../../../view_model/home_view_model.dart';

class FilterRadioList extends StatelessWidget {
  final int value;
  final String title;

  const FilterRadioList({
    Key? key,
    required this.value,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeViewModel>(context);
    return RadioListTile(
      value: value,
      title: Text(
        title,
        style: TextStyleConstants.regularStyle(fontSize: context.width * 0.036),
      ),
      groupValue: model.filterType,
      onChanged: (value) => model.changeFilterType(value),
    );
  }
}

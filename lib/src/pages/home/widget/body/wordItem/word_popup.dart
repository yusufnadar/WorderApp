import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../common/models/words_model.dart';
import '../../../../../core/constants/text_styles/text_style_constants.dart';
import '../../../../../core/exports/constants_exports.dart';
import '../../../view_model/home_view_model.dart';
import 'delete_dialog.dart';
import 'edit_dialog.dart';

class WordPopup extends StatelessWidget {
  final WordsModel item;
  final int index;

  const WordPopup({
    Key? key,
    required this.item,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeViewModel>(context);
    return PopupMenuButton(
      child: Image.asset(
        IconConstants.more,
        width: context.width * 0.06,
      ),
      onSelected: (value) {
        switch (value) {
          case 'delete':
            showDialog(
              context: context,
              builder: (_) => DeleteDialog(id: item.id!, context: context),
            );
            break;
          case 'edit':
            model.fillTexts(item);
            showDialog(
              context: context,
              builder: (_) => EditDialog(id: item.id!, index: index, context: context),
            );
            break;

          default:
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem<String>(
            value: 'edit',
            child: Text(
              'Edit',
              style: TextStyleConstants.regularStyle(
                fontSize: context.width * 0.038,
              ),
            ),
          ),
          PopupMenuItem<String>(
            value: 'delete',
            child: Text(
              'Delete',
              style: TextStyleConstants.regularStyle(
                fontSize: context.width * 0.038,
              ),
            ),
          ),
        ];
      },
    );
  }
}

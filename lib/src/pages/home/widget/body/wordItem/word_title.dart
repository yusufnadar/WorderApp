import 'package:flutter/material.dart';

import '../../../../../core/constants/text_styles/text_style_constants.dart';
import '../../../../../core/exports/constants_exports.dart';

class WordTitle extends StatelessWidget {
  final String title;
  const WordTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyleConstants.regularStyle(
        fontSize: context.width*0.04,
      ),
    );
  }
}

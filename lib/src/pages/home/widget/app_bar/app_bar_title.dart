import 'package:flutter/material.dart';

import '../../../../core/constants/text_styles/text_style_constants.dart';
import '../../../../core/exports/constants_exports.dart';

class AppBarTitle extends StatelessWidget {
  final String? title;
  const AppBarTitle({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? 'Worder',
      style: TextStyleConstants.boldStyle(
        fontSize: context.width*0.055,
        color: ColorConstants.white,
      ),
    );
  }
}

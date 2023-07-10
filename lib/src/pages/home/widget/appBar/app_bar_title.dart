import 'package:flutter/material.dart';

import '../../../../core/exports/constants_exports.dart';

class AppBarTitle extends StatelessWidget {
  final String? title;
  const AppBarTitle({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? 'Worder',
      style: TextStyleConstants.boldStyle(
        fontSize: 24,
        color: ColorConstants.white,
      ),
    );
  }
}

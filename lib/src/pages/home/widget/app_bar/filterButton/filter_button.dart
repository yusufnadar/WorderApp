import 'package:flutter/material.dart';

import '../../../../../core/exports/constants_exports.dart';
import 'filter_dialog.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.06),
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => const FilterDialog(),
          );
        },
        child: Image.asset(
          IconConstants.filter,
          width: context.width * 0.055,
          color: ColorConstants.white,
        ),
      ),
    );
  }
}

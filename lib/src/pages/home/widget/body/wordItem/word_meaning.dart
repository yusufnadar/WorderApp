import 'package:flutter/material.dart';
import '../../../../../core/exports/constants_exports.dart';

class WordMeaning extends StatelessWidget {
  final String meaning;

  const WordMeaning({Key? key, required this.meaning}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.height * 0.005,
      ),
      child: Text(
        meaning,
        style: TextStyleConstants.regularStyle(
          fontSize: 14,
          color: ColorConstants.darkGrey,
        ),
      ),
    );
  }
}

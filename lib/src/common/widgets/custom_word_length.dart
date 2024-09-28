import 'package:english_words/src/core/constants/colors/color_constants.dart';
import 'package:english_words/src/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../../core/constants/text_styles/text_style_constants.dart';

class CustomWordLength extends StatelessWidget {
  final int length;
  const CustomWordLength({super.key, required this.length});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: context.width * 0.03,
        top: context.height * 0.01,
        bottom: context.height * 0.01,
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          '$length words',
          style: TextStyleConstants.boldStyle(
            fontSize: 18,
            color: ColorConstants.white,
          ),
        ),
      ),
    );
  }
}

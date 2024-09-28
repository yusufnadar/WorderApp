import 'package:flutter/material.dart';

import '../../core/constants/text_styles/text_style_constants.dart';
import '../../core/exports/constants_exports.dart';

class CustomAlertButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  final Color? backgroundColor;

  const CustomAlertButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.width * 0.25,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: backgroundColor ?? ColorConstants.primary,
        ),
        padding: EdgeInsets.symmetric(
          vertical: context.height * 0.01,
        ),
        child: Text(
          title,
          style: TextStyleConstants.regularStyle(
            fontSize: context.width*0.04,
            color: ColorConstants.white,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../src/core/exports/constants_exports.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final List<Widget> actions;
  final MainAxisAlignment? actionsAlignment;
  final EdgeInsetsGeometry? contentPadding;

  const CustomAlertDialog({
    Key? key,
    required this.title,
    required this.children,
    required this.actions,
    this.actionsAlignment,
    this.contentPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: context.width * 0.1,
      ),
      actionsAlignment: actionsAlignment,
      titlePadding: EdgeInsets.only(
        right: context.width * 0.05,
        left: context.width * 0.05,
        top: context.height * 0.02,
      ),
      contentPadding: contentPadding,
      title: buildAlertDialogTitle(title),
      actionsPadding: EdgeInsets.only(
        right: context.width * 0.05,
        left: context.width * 0.05,
        bottom: context.height * 0.02,
      ),
      content: SizedBox(
        width: context.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
      actions: actions,
    );
  }

  Text buildAlertDialogTitle(String title) {
    return Text(
      title,
      style: TextStyleConstants.mediumStyle(
        fontSize: 18,
        color: ColorConstants.primary,
      ),
      textAlign: TextAlign.center,
    );
  }
}

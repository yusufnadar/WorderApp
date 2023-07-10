import 'package:flutter/material.dart';
import '../exports/constants_exports.dart';
import '../services/navigation/navigation_service.dart';

// Uygulama içerisinde kullanıcılara gösterdiğimiz uyarı mesajları
mixin ShowBar {
  void showErrorBar(
    dynamic message, {
    String? title,
    BuildContext? context,
  }) {
    ScaffoldMessenger.of(
            context ?? NavigationService.instance.navigatorKey.currentContext!)
        .showSnackBar(
      SnackBar(
        content: Text(
          message.toString(),
          style: TextStyleConstants.mediumStyle(
            color: ColorConstants.black,
          ),
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: ColorConstants.normalGrey,
      ),
    );
  }
}

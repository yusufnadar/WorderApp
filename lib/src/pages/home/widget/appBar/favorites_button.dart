import 'package:flutter/material.dart';
import '../../../../core/exports/constants_exports.dart';
import '../../../../core/services/navigation/navigation_service.dart';

class FavoritesButton extends StatelessWidget {
  const FavoritesButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => NavigationService.instance.navigateToPage(
        path: NavigationConstants.favorites,
      ),
      child: Image.asset(
        IconConstants.favorites,
        width: context.width * 0.06,
      ),
    );
  }
}

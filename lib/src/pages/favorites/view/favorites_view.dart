import 'package:flutter/material.dart';
import '../../../core/base/view/base_view.dart';
import '../viewModel/favorites_view_model.dart';
import '../widget/appBar/favorites_app_bar.dart';
import '../widget/body/favorites_view.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<FavoritesViewModel>(
      onModelReady: (model) => model.onModelReady(),
      builder: (context, model, child) => Scaffold(
        appBar: FavoritesAppBar(context: context),
        body: const FavoritesBody(),
      ),
    );
  }
}

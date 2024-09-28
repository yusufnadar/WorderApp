import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/home_view_model.dart';
import '../widget/app_bar/home_app_bar.dart';
import '../widget/body/home_body.dart';
import '../widget/floating_add_button/floating_add_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeViewModel>(context, listen: false).getWords();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeViewModel>(context);
    return PopScope(
      canPop: !model.isFocus,
      onPopInvoked: (didPop) async {
        if (!didPop) {
          model.changeFocus(false);
        }
      },
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: const FloatingAddButton(),
        appBar: HomeAppBar(context: context),
        body: const HomeBody(),
      ),
    );
  }
}

// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/locator/locator_service.dart';
import '../view_model/base_view_model.dart';

class BaseView<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final void Function(T model)? onModelReady;
  final Function(T model)? onDispose;

  const BaseView({
    Key? key,
    required this.builder,
    this.onModelReady,
    this.onDispose,
  }) : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends ChangeNotifier> extends State<BaseView<T>> {

  T model = locator<T>();

  @override
  void initState() {
    (model as BaseViewModel).viewModelContext = context;
    if (widget.onModelReady != null) widget.onModelReady!(model);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) widget.onDispose!(model);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => model,
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }
}

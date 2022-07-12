import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'base_state.dart';

class BaseView<T extends Store> extends StatefulWidget {
  const BaseView({
    Key? key,
    required this.viewModel,
    required this.onModelReady,
    this.onDispose,
    required this.onPageBuilder,
  }) : super(key: key);

  final T viewModel;
  final Function(T model) onModelReady;
  final VoidCallback? onDispose;
  final Widget Function(BuildContext context, T value) onPageBuilder;

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends Store> extends BaseState<BaseView<T>> {
//
  late T model;
//

  @override
  void initState() {
    model = widget.viewModel;
    widget.onModelReady(model);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) widget.onDispose!();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, model);
  }
}

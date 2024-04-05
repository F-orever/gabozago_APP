import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'base_ui_event.dart';
import 'base_view_model.dart';

abstract class BaseView<T extends BaseViewModel> extends GetView<T> {
  const BaseView({super.key});

  T get vm => controller;

  @protected
  Widget buildView(BuildContext context);

  @override
  Widget build(BuildContext context) {
    final T vm = Get.find<T>();

    if (!vm.hasListener) {
      vm.uiEventStream.listen(
        (event) async => await _handleUiEvent(context, event),
      );
    }

    return buildView(context);
  }
}

Future<void> _handleUiEvent(BuildContext context, BaseUiEvent event) async {
  if (event is OnDialog) {
    await showDialog(context: context, builder: (_) => event.dialog);
  } else if (event is CloseDialog) {
    if (Get.isDialogOpen!) Get.back();
  } else if (event is ShowToast) {
    await Fluttertoast.showToast(msg: event.message);
  } else if (event is ShowProgressIndicator) {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );
  }
}

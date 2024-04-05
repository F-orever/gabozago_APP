import 'dart:async';

import 'package:get/get.dart';

import 'base_ui_event.dart';

class BaseViewModel extends GetxController {
  late final StreamController<BaseUiEvent> _uiEventController;
  Stream<BaseUiEvent> get uiEventStream => _uiEventController.stream;

  bool _hasListener = false;
  bool get hasListener => _hasListener;

  void addUiEvent(BaseUiEvent event) {
    _uiEventController.add(event);
  }

  @override
  void onInit() {
    super.onInit();
    _uiEventController = StreamController<BaseUiEvent>.broadcast(onListen: () => _hasListener = true);
  }

  @override
  void onClose() {
    _uiEventController.close();
    super.onClose();
  }
}

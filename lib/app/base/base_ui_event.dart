import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_ui_event.freezed.dart';

@freezed
sealed class BaseUiEvent with _$BaseUiEvent {
  const factory BaseUiEvent.onDialog(Widget dialog) = OnDialog;
  const factory BaseUiEvent.closeDialog() = CloseDialog;
  const factory BaseUiEvent.showToast(String message) = ShowToast;
  const factory BaseUiEvent.showProgressIndicator() = ShowProgressIndicator;
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lazu_tree/app/shared/ui/widgets/app_toast.dart';

mixin AppToastMixin<T extends StatefulWidget> on State<T> {
  FToast? _fToast;

  FToast get fToast {
    if (_fToast == null) {
      _fToast = FToast();
      _fToast!.init(context);
    }

    return _fToast!;
  }

  void showToast({
    required String title,
    required Icon icon,
    required Color backgroundColor,
    String? description,
    ToastGravity gravity = ToastGravity.BOTTOM,
    Duration toastDuration = const Duration(seconds: 3),
  }) {
    fToast.showToast(
      child: AppToast(
        title: title,
        description: description,
        icon: icon,
        backgroundColor: backgroundColor,
      ),
      gravity: gravity,
      toastDuration: toastDuration,
    );
  }

  void showSuccessToast({
    required String title,
    String? description,
    ToastGravity gravity = ToastGravity.BOTTOM,
    Duration toastDuration = const Duration(seconds: 3),
  }) {
    fToast.showToast(
      child: AppToast.success(
        title: title,
        description: description,
      ),
      gravity: gravity,
      toastDuration: toastDuration,
    );
  }

  void showErrorToast({
    required String title,
    String? description,
    ToastGravity gravity = ToastGravity.BOTTOM,
    Duration toastDuration = const Duration(seconds: 3),
  }) {
    fToast.showToast(
      child: AppToast.error(
        title: title,
        description: description,
      ),
      gravity: gravity,
      toastDuration: toastDuration,
    );
  }

  void showWarningToast({
    required String title,
    String? description,
    ToastGravity gravity = ToastGravity.BOTTOM,
    Duration toastDuration = const Duration(seconds: 3),
  }) {
    fToast.showToast(
      child: AppToast.warning(
        title: title,
        description: description,
      ),
      gravity: gravity,
      toastDuration: toastDuration,
    );
  }

  void showInfoToast({
    required String title,
    String? description,
    ToastGravity gravity = ToastGravity.BOTTOM,
    Duration toastDuration = const Duration(seconds: 3),
  }) {
    fToast.showToast(
      child: AppToast.info(
        title: title,
        description: description,
      ),
      gravity: gravity,
      toastDuration: toastDuration,
    );
  }

  void clearAlerts() {
    _fToast
      ?..removeCustomToast()
      ..removeQueuedCustomToasts();
  }
}

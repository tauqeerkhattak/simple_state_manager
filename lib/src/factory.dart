import 'dart:developer';

import 'controller/state_controller.dart';

class Factory {
  static final List<dynamic> _controllers = <dynamic>[];
  static T read<T extends StateController>(T Function() creator) {
    for (final controller in _controllers) {
      if (controller is T) {
        log(
          'Controller found: ${controller.runtimeType}',
          name: 'SIMPLE STATE MANAGER',
        );
        return controller;
      }
    }
    final newController = creator();
    _controllers.add(newController);
    return newController;
  }
}

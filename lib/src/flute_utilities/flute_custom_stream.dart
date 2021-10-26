import 'package:flutter/material.dart';

typedef _TCallback<T> = void Function();

class FluteCustomStream<T> {
  final List<_TCallback> _listeners = [];

  /// Notifies all listeners.
  void notifyListeners() {
    for (var listener in _listeners) {
      try {
        listener();
      } catch (error) {
        debugPrint(
            'Error happened while calling the listener: $listener - $error');
      }
    }
  }

  void listen(_TCallback listener) {
    _listeners.add(listener);
  }

  void listenIfHasNoListeners(_TCallback listener) {
    if (_listeners.isNotEmpty) return;
    _listeners.add(listener);
  }

  void removeListener(_TCallback listener) {
    _listeners.remove(listener);
  }

  void dispose() {
    _listeners.clear();
  }
}

import 'package:flutter/material.dart';
import '../../flute.dart';

/// Regular callback type for the whole library.
typedef VoidCallback = void Function();

/// Regular future callback type for the whole library.
typedef FutureVoidCallback = Future<void> Function();

/// A callback that returns Widget.
/// It is current used only for FluteBuilder.
typedef BuilderCallback = Widget Function();

/// It is used for FluteWatcher right now,
/// Returns a void function that gives the [controller] with type [T].
typedef WatcherCallback<T extends FluteController> = void Function(
    T controller);

/// It is used for Flutos right now,
/// Returns a void function that gives the [controller] with type [T].
typedef ControllerCallback<T extends FluteController> = Widget Function(
    T controller);

/// We use this only for filtering Builders.
typedef FilterCallback<T extends FluteController> = Object? Function(
    T controller);

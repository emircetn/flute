import 'package:flutter/material.dart';

import '../../flute.dart';

/// This mixin provides informations about the device in an easier way.
///
/// The context is going to be provided by *Flute*, so we have to override
/// this context.
mixin FluteDevice {
  /// The [BuildContext]:[context] of your app.
  BuildContext? get context;

  /// The horizontal extent of this size.
  double get width => MediaQuery.of(Flute.context).size.width;

  /// The vertical extent of this size.
  double get height => MediaQuery.of(Flute.context).size.height;

  /// The aspect ratio of this size.
  ///
  ///This returns the [width] divided by the [height].
  double get aspectRatio => MediaQuery.of(Flute.context).size.aspectRatio;

  /// Whether device is wider than tall or not.
  bool get isLandscape =>
      MediaQuery.of(Flute.context).orientation == Orientation.landscape;

  /// Whether device is taller than wide or not.
  bool get isPortrait =>
      MediaQuery.of(Flute.context).orientation == Orientation.portrait;

  /// App theme.
  ThemeData get theme => Theme.of(context!);

  /// App theme mode (if dark returns true, else false).
  bool get isDarkMode => theme.brightness == Brightness.dark;

  /// The number of device pixels for each logical pixel. This number might not
  ///  be a power of two. Indeed, it might not even be an integer. For example,
  ///  the Nexus 6 has a device pixel ratio of 3.5.
  double get devicePixelRatio => MediaQuery.of(Flute.context).devicePixelRatio;

  /// Returns true if the device is *android*.
  bool get isAndroid => Theme.of(context!).platform == TargetPlatform.android;

  /// Returns true if the device is *iOS*.
  bool get isIOS => Theme.of(context!).platform == TargetPlatform.iOS;

  /// Returns true if the device is *macOS*.
  bool get isMacOS => Theme.of(context!).platform == TargetPlatform.macOS;

  /// Returns true if the device is *linux*.
  bool get isLinux => Theme.of(context!).platform == TargetPlatform.linux;

  /// Returns true if the device is *windows*.
  bool get isWindows => Theme.of(context!).platform == TargetPlatform.windows;

  /// Returns true if the device is *fuchsia*.
  bool get isFuchsia => Theme.of(context!).platform == TargetPlatform.fuchsia;
}

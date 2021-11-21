/// flute is the simplest state management solution ever, at least I think so.
///
/// It depends on nothing, works really fast with minimum code usage.
///
/// With flute, you don't need to wrap your material app for state,
/// you don't need any complex libraries and most importantly your don't
///  need context to have a state or update state.
library flute;

// Directly exporting riverpod instead of installing riverpod.
export 'package:flutter_riverpod/flutter_riverpod.dart';

export 'src/constants.dart';
export 'src/extensions/index.dart';
export 'src/flute_instance.dart';
export 'src/notifiers/index.dart';
export 'src/boilerplates/index.dart';
export 'src/storage/index.dart';
export 'src/utilities/index.dart';
export 'src/other/index.dart';


/// Formlara bir şeyler yapalım.
/// Validatörler yapalım
/// Validate için for loop atalım.
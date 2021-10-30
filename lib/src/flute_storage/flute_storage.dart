import 'package:flute/flute.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// The implementation of [FluteStorage]
class _FluteStorage {
  /// [listen] gives you a callback that called whenever the [key]
  /// you declared changes/creates.
  ///
  /// Usage
  ///
  /// ```dart
  /// listen<int>('count',(int count) => {
  ///   debugPrint('Count is changed to $count');
  /// });
  /// ```
  VoidFunction listen<T>(
    String key,
    void Function(T? value) callback, {
    bool callImmediately = true,
  }) {
    final _stream = _box.watch(key: key).listen((e) => callback(e.value));

    if (callImmediately) {
      callback(read<T>(key));
    }

    return _stream.cancel;
  }

  late final Box _box;

  /// Returns true if the storage contains that key.
  bool contains(String key) => _box.containsKey(key);

  /// [init] function is required to start [FluteStorage]
  ///
  /// The best practice to use it is using the function at the start of *main*
  /// function of your project.
  ///
  /// Example
  ///
  /// ```dart
  ///void main(List<String> arguments) {
  ///  await FluteStorage.init();
  ///}
  ///```
  Future<void> init([String boxName = 'flute', String? subDir]) async {
    await Hive.initFlutter(subDir);
    await Hive.openBox(boxName);
    _box = Hive.box(boxName);
  }

  /// Reads the storage, if there are any match with the key, it returns
  /// the value of it. If there are no match, it will return null.
  ///
  /// You can give a type as its return type but it should match the
  /// written type.
  ///
  /// Usage
  ///
  /// ```dart
  /// final myName = FluteStorage.read<String>('myName');
  /// ```
  T? read<T>(String key) => _box.get(key);

  /// Writes a value to the storage with a key.
  ///
  /// Usage
  ///
  /// ```dart
  /// FluteStorage.write<String>('myName','Flute');
  /// ```
  Future<void> write<T>(String key, T value) async =>
      await _box.put(key, value);

  /// Writes multiple data to the local storage.
  ///
  /// Usage
  ///
  /// ```dart
  /// FluteStorage.writeMulti({'myName' : 'Flute', 'flute' : 'best'});
  /// ```
  Future<void> writeMulti(Map<String, dynamic> data) async =>
      await _box.putAll(data);

  /// Writes a value to the storage with a key if the key's value is null.
  ///
  /// Usage
  ///
  /// ```dart
  /// FluteStorage.removeKey('myName');
  /// ```
  Future<void> removeKey(String key) async => await _box.delete(key);

  /// Writes a value to the storage with a key if the key's value is null.
  ///
  /// Usage
  ///
  /// ```dart
  /// FluteStorage.removeKeys(['myName', 'flute']);
  /// ```
  Future<void> removeKeys(List<String> keys) async =>
      await _box.deleteAll(keys);

  /// Deletes all keys and values from the storage, the file
  /// will still stay at its location.
  Future<void> clearStorage() async => await _box.clear();

  /// Deletes everything and the file.
  Future<void> deleteStorage() async => await Hive.deleteBoxFromDisk(_box.name);

  /// Closes the storage.
  Future<void> dispose() async => await _box.close();

  /// Creates sub box instances
  Future<_FluteStorage> openCustomBox(String boxName) async =>
      _FluteCustomStorage()._openAndGet(boxName);

  /// Creates sub box instances
  _FluteStorage customBox(String boxName) =>
      _FluteCustomStorage()._get(boxName);
}

/// [FluteStorage] is a local storage implementation for *Flute*.
///
/// Main methods are [FluteStorage.read()] and [FluteStorage.write(key, value)]
///
/// To use it, you should add this line to your main function.
///
/// ```dart
/// await FluteStorage.init();
/// ```
// ignore: non_constant_identifier_names
final _FluteStorage FluteStorage = _FluteStorage();

class _FluteCustomStorage extends _FluteStorage {
  _FluteStorage _get(String boxName) {
    _box = Hive.box(boxName);
    return this;
  }

  Future<_FluteStorage> _openAndGet(String boxName) async {
    await Hive.openBox(boxName);
    _box = Hive.box(boxName);
    return this;
  }
}

import 'package:hive_ce/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HiveStorage<T> {
  final Box<T> _box;
  final boxName = '${T.toString().toLowerCase()}_box';

  HiveStorage(this._box);

  // @PostConstruct(preResolve: true)
  // Future<void> init() async {
  //   _box = await Hive.openBox<T>(boxName);
  // }

  Iterable<T> fetchAll() {
    return _box.values;
  }

  Future<void> addSingle(T value) async {
    await _box.add(value);
    await _box.flush();
  }

  Future<void> update(Iterable<T> values) async {
    await _box.clear();
    await _box.addAll(values);
    await _box.flush();
  }

  Future<void> updateSingle(String key, T value) async {
    await _box.put(key, value);
    await _box.flush();
  }

  Future<void> delete(String key) async {
    await _box.delete(key);
    await _box.flush();
  }

  Future<void> clear() async {
    await _box.clear();
    await _box.flush();
  }

  Future<void> updateAsyncValue(AsyncValue<Iterable<T>> val) async {
    if (val is AsyncData<Iterable<T>>) {
      final values = val.value;
      await update(values);
    }
  }

  Future<void> updateSingleAsyncValue(String key, AsyncValue<T> val) async {
    if (val is AsyncData<T>) {
      final value = val.value;
      await updateSingle(key, value);
    }
  }
}

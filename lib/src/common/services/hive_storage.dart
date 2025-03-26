import 'package:hive_ce/hive.dart';

class HiveStorage<T> {
  late final Box<T> _box;

  HiveStorage(this._box);
  // final boxName = '${T.toString().toLowerCase()}_box';

  // HiveStorage(this._box);

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
}

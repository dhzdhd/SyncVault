import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/adapters.dart';

Future<Box<T>> setupHiveBox<T>(String boxPath) async {
  late final Box<T> box;
  final boxName = '${T.toString().toLowerCase()}_box';

  try {
    box = await Hive.openBox<T>(boxName, path: boxPath);
    GetIt.I.registerSingleton<Box<T>>(box);
  } catch (err) {
    await Hive.deleteBoxFromDisk(boxName);

    box = await Hive.openBox<T>(boxName, path: boxPath);
    GetIt.I.registerSingleton<Box<T>>(box);
  }
  return box;
}

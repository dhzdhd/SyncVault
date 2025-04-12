import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:hashlib/hashlib.dart';
import 'package:syncvault/errors.dart';

class FileComparer {
  TaskEither<AppError, HashDigest> calcFileHash(File file) {
    return TaskEither.tryCatch(
      () async {
        XXHash32 hasher = const XXHash32();
        final hash = await hasher.file(file);

        return hash;
      },
      (e, st) {
        return e.handleError(e.toString(), st);
      },
    );
  }

  TaskEither<AppError, HashDigest> calcTotalHash(List<HashDigest> hashes) {
    return TaskEither.tryCatch(
      () async {
        final totalHashString = hashes.map((hash) => hash.toString()).join();

        XXHash32 hasher = const XXHash32();
        final hash = hasher.string(totalHashString);

        return hash;
      },
      (e, st) {
        return e.handleError(e.toString(), st);
      },
    );
  }

  TaskEither<AppError, HashDigest> calcHash(List<File> files) {
    return TaskEither.Do(($) async {
      final futureHashes = files.map((file) async => $(calcFileHash(file)));
      final hashes = await Future.wait(futureHashes);
      return await $(calcTotalHash(hashes));
    });
  }

  bool isSameFolder(HashDigest hash1, HashDigest hash2) => hash1.isEqual(hash2);
}

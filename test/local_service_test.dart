import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:syncvault/src/home/services/local.dart';

void main() {
  group('buildFileTree Tests', () {
    late Directory testDir;

    setUp(() async {
      // Create a temporary test directory
      testDir = await Directory.systemTemp.createTemp('test_file_tree_');
    });

    tearDown(() async {
      // Clean up test directory
      if (await testDir.exists()) {
        await testDir.delete(recursive: true);
      }
    });

    test('should correctly identify a file as not a directory', () async {
      // Create a test file
      final testFile = File('${testDir.path}/test.txt');
      await testFile.writeAsString('test content');

      // Build the tree
      final fileModel = await buildFileTree(testFile);

      expect(fileModel.isDirectory, false);
      expect(fileModel.name, 'test.txt');
      expect(fileModel.children, isEmpty);
    });

    test('should correctly identify a directory', () async {
      // Create a test subdirectory
      final subDir = Directory('${testDir.path}/subdir');
      await subDir.create();

      // Build the tree
      final fileModel = await buildFileTree(subDir);

      expect(fileModel.isDirectory, true);
      expect(fileModel.name, 'subdir');
      expect(fileModel.children, isEmpty); // Empty directory
    });

    test('should recursively build tree for directory with files', () async {
      // Create structure: testDir/subdir/file.txt
      final subDir = Directory('${testDir.path}/subdir');
      await subDir.create();
      final file = File('${subDir.path}/file.txt');
      await file.writeAsString('content');

      // Build the tree
      final fileModel = await buildFileTree(testDir);

      expect(fileModel.isDirectory, true);
      expect(fileModel.children.length, 1);
      expect(fileModel.children[0].name, 'subdir');
      expect(fileModel.children[0].isDirectory, true);
      expect(fileModel.children[0].children.length, 1);
      expect(fileModel.children[0].children[0].name, 'file.txt');
      expect(fileModel.children[0].children[0].isDirectory, false);
    });

    test('should handle nested directory structure', () async {
      // Create structure:
      // testDir/
      //   dir1/
      //     file1.txt
      //     dir2/
      //       file2.txt
      final dir1 = Directory('${testDir.path}/dir1');
      await dir1.create();
      final file1 = File('${dir1.path}/file1.txt');
      await file1.writeAsString('content1');
      
      final dir2 = Directory('${dir1.path}/dir2');
      await dir2.create();
      final file2 = File('${dir2.path}/file2.txt');
      await file2.writeAsString('content2');

      // Build the tree
      final fileModel = await buildFileTree(testDir);

      expect(fileModel.isDirectory, true);
      expect(fileModel.children.length, 1);
      
      final dir1Model = fileModel.children[0];
      expect(dir1Model.name, 'dir1');
      expect(dir1Model.children.length, 2); // file1.txt and dir2
      
      // Check that both file and subdirectory are present
      final hasFile = dir1Model.children.any((c) => c.name == 'file1.txt');
      final hasDir = dir1Model.children.any((c) => c.name == 'dir2');
      expect(hasFile, true);
      expect(hasDir, true);
    });

    test('should correctly parse file name from path', () async {
      final file = File('${testDir.path}/my-test-file.doc');
      await file.writeAsString('content');

      final fileModel = await buildFileTree(file);

      expect(fileModel.name, 'my-test-file.doc');
    });
  });
}

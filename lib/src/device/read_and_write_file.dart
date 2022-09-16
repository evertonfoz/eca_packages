import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

enum FileTypeECA { image }

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<void> copyFileFromPath({required String sourcePath}) async {
  final String targetPath = await _localPath;
  final String fileName = basename(sourcePath);

  final File sourceFile = File(sourcePath);
  final File targetFile = File('$targetPath/$fileName');

  if (await targetFile.exists()) {
    await targetFile.delete();
  }

  await sourceFile.copy('$targetPath/$fileName');
}

Future<File> readFileFromDocumentsDirectory({required String fileName}) async {
  final String localPath = await _localPath;

  return File('$localPath/$fileName');
}

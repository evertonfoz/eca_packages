import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

enum FileTypeECA { image }

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<void> removeFile({required String filePath}) async {
  final File sourceFile = File(filePath);

  if (await sourceFile.exists()) {
    await sourceFile.delete();
  }
}

Future<void> copyFileFromPath(
    {required String sourcePath, required String nameToFile}) async {
  final String targetPath = await _localPath;
  // final String fileName = basename(sourcePath);

  final File sourceFile = File(sourcePath);
  final File targetFile = File(
      '$targetPath/${extractAtAndPointsFromFilename(fileName: nameToFile)}');

  if (await targetFile.exists()) {
    await targetFile.delete();
  }

  await sourceFile.copy('$targetPath/$nameToFile');
}

Future<String> getFilePathFromDocumentsDirectory(
    {required String filePath}) async {
  final String localPath = await _localPath;
  final String fileName = basename(filePath);

  return '$localPath/$fileName';
}

Future<File> readFileFromDocumentsDirectory({required String filePath}) async {
  final String localPath = await _localPath;
  final String fileName = basename(filePath);

  return File('$localPath/$fileName');
}

Future<bool> fileExistsAtDocumentsDirectory({required String filePath}) async {
  final String localPath = await _localPath;
  final String fileName = basename(filePath);

  final File targetFile = File('$localPath/$fileName');

  return await targetFile.exists();
}

Future<void> downloadAndSaveToDocumentsDirectory({required String url}) async {
  final String localPath = await _localPath;
  final String fileName = basename(url);

  try {
    final response = await Dio().get(
      url,
      options: Options(
        responseType: ResponseType.bytes,
        followRedirects: false,
        receiveTimeout: const Duration(seconds: 0),
      ),
    );

    File file = File('$localPath/$fileName');

    final raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(response.data);
    await raf.close();

    return;
  } on Exception catch (e) {
    print(e);
  }
}

extractAtAndPointsFromFilename({required String fileName}) {
  return fileName.replaceAll('@', '_').replaceAll('.', '_');
}

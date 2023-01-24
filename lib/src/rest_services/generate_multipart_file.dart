// import 'dart:io';

// import 'package:http/http.dart' as http;
// import 'package:http_parser/http_parser.dart';

// generateMultiPartFile({required String filePath}) async {
//   File image = File(filePath);

//   var stream = http.ByteStream(image.openRead())..cast();
//   var length = await image.length();

//   return http.MultipartFile('avatarFile', stream, length,
//       filename: filePath.split('/').last,
//       contentType: MediaType('image',
//           getFileNameExtension(filePath: filePath) == 'png' ? 'png' : 'jpeg'));
// }

// getFileNameExtension({required String filePath}) {
//   var fileName = filePath.split('/').last;
//   return fileName.split('.').last;
// }

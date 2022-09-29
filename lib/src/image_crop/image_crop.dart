// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_crop/image_crop.dart';
// import 'package:image_picker/image_picker.dart';

// class ImageCropECA extends StatefulWidget {
//   final String filePathToCrop;

//   const ImageCropECA({
//     Key? key,
//     required this.filePathToCrop,
//   }) : super(key: key);

//   @override
//   State<ImageCropECA> createState() => _ImageCropECAState();
// }

// class _ImageCropECAState extends State<ImageCropECA> {
//   final cropKey = GlobalKey<CropState>();
//   File? _file;
//   File? _sample;
//   File? _lastCropped;

//   @override
//   void initState() {
//     super.initState();
//     _openImage(filePath: widget.filePathToCrop);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _file?.delete();
//     _sample?.delete();
//     _lastCropped?.delete();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.black,
//         padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
//         child:
//             _sample == null ? Container() : Crop.file(_sample!, key: cropKey),
//       ),
//     );
//   }

//   // Widget _buildOpeningImage() {
//   //   return Center(child: _buildOpenImage());
//   // }

//   // Widget _buildCroppingImage() {
//   //   return Column(
//   //     children: <Widget>[
//   //       Expanded(
//   //         child: Crop.file(_sample!, key: cropKey),
//   //       ),
//   //       Container(
//   //         padding: const EdgeInsets.only(top: 20.0),
//   //         alignment: AlignmentDirectional.center,
//   //         child: Row(
//   //           mainAxisAlignment: MainAxisAlignment.spaceAround,
//   //           children: <Widget>[
//   //             TextButton(
//   //               child: const Text(
//   //                 'Crop Image',
//   //               ),
//   //               onPressed: () => _cropImage(),
//   //             ),
//   //             _buildOpenImage(),
//   //           ],
//   //         ),
//   //       )
//   //     ],
//   //   );
//   // }

//   // Widget _buildOpenImage() {
//   //   return TextButton(
//   //     child: const Text(
//   //       'Open Image',
//   //     ),
//   //     onPressed: () => _openImage(),
//   //   );
//   // }

//   Future<void> _openImage({required String filePath}) async {
//     // final pickedFile =
//     //     await ImagePicker().pickImage(source: ImageSource.gallery);
//     final file = File(filePath);
//     final sample = await ImageCrop.sampleImage(
//       file: file,
//       preferredHeight: 1, // MediaQuery.of(context).size.height.toInt(),
//       preferredWidth: 1, // MediaQuery.of(context).size.width.toInt(),
//       // preferredSize: context.size!.longestSide.ceil(),
//     );

//     _sample?.delete();
//     _file?.delete();

//     setState(() {
//       _sample = sample;
//       _file = file;
//     });
//   }

//   Future<void> _cropImage() async {
//     final scale = cropKey.currentState!.scale;
//     final area = cropKey.currentState!.area;
//     if (area == null) {
//       // cannot crop, widget is not setup
//       return;
//     }

//     // scale up to use maximum possible number of pixels
//     // this will sample image in higher resolution to make cropped image larger
//     final sample = await ImageCrop.sampleImage(
//       file: _file!,
//       preferredSize: (2000 / scale).round(),
//     );

//     final file = await ImageCrop.cropImage(
//       file: sample,
//       area: area,
//     );

//     sample.delete();

//     _lastCropped?.delete();
//     _lastCropped = file;

//     debugPrint('$file');
//   }
// }

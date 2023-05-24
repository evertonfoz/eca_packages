// import 'dart:io';

// import 'package:eca_packages/eca_packages.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:image_size_getter/file_input.dart';
// import 'package:image_size_getter/image_size_getter.dart';

// const int kMaxImageHeight = 825;

// class CropImagePageECA extends StatefulWidget {
//   final String title;
//   final String originalFilePath;
//   final Color titleColor;
//   final Color iconProgressBarColor;
//   final Color progressBarContainerColor;
//   final Color valueProgressBarContainerColor;
//   final BuildContext parentContext;

//   const CropImagePageECA({
//     Key? key,
//     required this.title,
//     required this.originalFilePath,
//     required this.titleColor,
//     required this.iconProgressBarColor,
//     required this.progressBarContainerColor,
//     required this.valueProgressBarContainerColor,
//     required this.parentContext,
//   }) : super(key: key);

//   @override
//   State<CropImagePageECA> createState() => _CropImagePageECAState();
// }

// class _CropImagePageECAState extends State<CropImagePageECA> {
//   // final GlobalKey<CropState> _imageCropKey = GlobalKey<CropState>();
//   // double _aspectRation = 1;
//   // late double aspectImageSizeToScreeSize;
//   late File fileOriginalImage;
//   late double progressBarWidthToAspectRadio;
//   late int widthFactorToProgressBarWidthToAspectRadio = 0;
//   // late Size originalImageSize;
//   late int imageWidth;
//   late int imageHeigth;
//   late double mediaWidth;
//   late double mediaHeight;

//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration.zero, () async {
//       await hideNavigationBar();
//     });

// //TODO Função
//     fileOriginalImage = File(widget.originalFilePath);
//     final Size originalImageSize = ImageSizeGetter.getSize(
//       FileInput(fileOriginalImage),
//     );

//     imageWidth = originalImageSize.width;
//     imageHeigth = originalImageSize.height;

//     if (imageHeigth > (kMaxImageHeight * 0.5)) {
//       double sizeDiference =
//           ((imageHeigth - kMaxImageHeight * 0.5) * 100 / imageHeigth) / 100;

//       sizeDiference = 1 - sizeDiference;

//       imageWidth = (imageWidth * sizeDiference).toInt();
//       imageHeigth = (imageHeigth * sizeDiference).toInt();
//     } else {
//       double sizeDiference =
//           (((kMaxImageHeight * 0.5) - imageHeigth) * 100 / kMaxImageHeight) /
//               100;

//       sizeDiference = 1 - sizeDiference;

//       imageWidth = (imageWidth * sizeDiference).toInt();
//       imageHeigth = (imageHeigth * sizeDiference).toInt();
//     }

//     if (originalImageSize.needRotate) {
//       var aux = imageHeigth;
//       imageHeigth = imageWidth;
//       imageWidth = aux;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     progressBarWidthToAspectRadio = MediaQuery.of(context).size.width * 0.6;
//     // double mqWidth = MediaQuery.of(widget.parentContext).size.width;
//     // double mqHeight = MediaQuery.of(widget.parentContext).size.height;
//     mediaWidth = imageWidth > MediaQuery.of(context).size.width
//         ? MediaQuery.of(context).size.width
//         : imageWidth.toDouble();
//     mediaHeight = (imageWidth > MediaQuery.of(context).size.width
//         ? MediaQuery.of(context).size.height * 0.5
//         : imageHeigth.toDouble());
//     mediaHeight = mediaHeight * (imageHeigth / imageWidth);

//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Stack(
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(4.0),
//                       child: TextECA(
//                         text: widget.title,
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold,
//                         color: widget.titleColor,
//                         textAlign: TextAlign.start,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(4.0),
//                       child: TextECA(
//                         text:
//                             'Pressione de maneira prolongada os botões abaixo para obter uma dica do funcionamento deles. Faça o mesmo com o + e - na barra ao lado dos botões.',
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                         color: widget.titleColor,
//                         textAlign: TextAlign.start,
//                       ),
//                     ),
//                     Padding(
//                       padding:
//                           const EdgeInsets.only(top: 10.0, left: 2, right: 2),
//                       child: Container(
//                         decoration: BoxDecoration(
//                             color: Colors.black87,
//                             borderRadius:
//                                 const BorderRadius.all(Radius.circular(4)),
//                             shape: BoxShape.rectangle,
//                             border: Border.all(
//                               color: Colors.black,
//                               width: 4,
//                             )),
//                         child: Center(
//                           child: Container(
//                             color: Colors.black87,
//                             width: mediaWidth - 16, //Padding e borda
//                             height: mediaHeight -
//                                 18, // * aspectImageSizeToScreeSize,
//                             child: Crop(
//                               alwaysShowGrid: true,
//                               key: _imageCropKey,
//                               image: Image.file(
//                                 fileOriginalImage,
//                                 fit: BoxFit.none,
//                                 width: mediaWidth - 16,
//                                 height: mediaHeight - 18,
//                               ).image,
//                               aspectRatio: _buildAspectRadio(),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),

//             Positioned(
//               bottom: 3,
//               left: 8,
//               child: Container(
//                 color: Colors.white54,
//                 width: MediaQuery.of(context).size.width,
//                 child: Row(
//                   children: [
//                     SizedBox(
//                       width: 30,
//                       child: Visibility(
//                         visible: widthFactorToProgressBarWidthToAspectRadio > 0,
//                         child: InkWell(
//                           onTap: () {
//                             setState(() {
//                               widthFactorToProgressBarWidthToAspectRadio--;
//                             });
//                           },
//                           child: Icon(
//                             Icons.remove,
//                             size: 30,
//                             color: widget.iconProgressBarColor,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       alignment: Alignment.centerLeft,
//                       height: 32,
//                       width: progressBarWidthToAspectRadio,
//                       decoration: BoxDecoration(
//                         color: widget.progressBarContainerColor,
//                         border: Border.all(
//                             color: widget.valueProgressBarContainerColor,
//                             width: 2),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: FractionallySizedBox(
//                         widthFactor:
//                             widthFactorToProgressBarWidthToAspectRadio / 10,
//                         child: Container(
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                             color: widget.valueProgressBarContainerColor,
//                             // border: Border.all(
//                             //     color: kBrandMaterialColor.shade100, width: 2),
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: TextECA(
//                               text:
//                                   '${(widthFactorToProgressBarWidthToAspectRadio * 10).toInt()}',
//                               color: Colors.white),
//                         ),
//                       ),
//                     ),
//                     Visibility(
//                       visible: widthFactorToProgressBarWidthToAspectRadio < 10,
//                       child: InkWell(
//                         onTap: () {
//                           setState(() {
//                             widthFactorToProgressBarWidthToAspectRadio++;
//                           });
//                         },
//                         child: Icon(
//                           Icons.add,
//                           size: 30,
//                           color: widget.iconProgressBarColor,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ), // Row(
//             Positioned(
//               right: 8,
//               bottom: 3,
//               child: Column(
//                 // mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   FloatingActionButton(
//                     tooltip: 'Aceitar a imagem dentro da grade',
//                     backgroundColor: Colors.black38,
//                     heroTag: 'crop',
//                     onPressed: () async {
//                       final crop = _imageCropKey.currentState;
//                       // final scale = crop?.scale;
//                       final area = crop?.area;
//                       await ImageCrop.requestPermissions();

//                       final sampledFile = await ImageCrop.sampleImage(
//                         file: File(widget.originalFilePath),
//                         preferredWidth: (1024 / crop!.scale).round(),
//                         preferredHeight: (4096 / crop.scale).round(),
//                       );

//                       final croppedFile = await ImageCrop.cropImage(
//                         file: sampledFile,
//                         area: crop.area!,
//                       );

//                       Modular.to.pop([
//                         croppedFile.path,
//                         mediaWidth,
//                         mediaHeight,
//                       ]);
//                     },
//                     child: Icon(
//                       Icons.crop,
//                       color: widget.progressBarContainerColor,
//                       size: 30,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   FloatingActionButton(
//                     tooltip: 'Ficar com a imagem original, sem a grade',
//                     backgroundColor: Colors.black38,
//                     heroTag: 'original',
//                     onPressed: () async {
//                       Modular.to.pop([
//                         widget.originalFilePath,
//                         mediaWidth,
//                         mediaHeight,
//                       ]);
//                       // Navigator.of(context).pop(widget.originalFilePath);
//                     },
//                     child: Icon(
//                       Icons.crop_original,
//                       color: widget.progressBarContainerColor,
//                       size: 40,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   FloatingActionButton(
//                     tooltip: 'Voltar para escolher outra imagem',
//                     backgroundColor: Colors.black38,
//                     heroTag: 'exit',
//                     onPressed: () async {
//                       Modular.to.pop();
//                     },
//                     child: Icon(
//                       Icons.exit_to_app,
//                       color: widget.progressBarContainerColor,
//                       size: 40,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   _buildAspectRadio() {
//     if (imageHeigth > imageWidth) {
//       return ((2 - widthFactorToProgressBarWidthToAspectRadio / 10) - 0.4);
//     } else if (imageHeigth == imageWidth) {
//       return ((2 - widthFactorToProgressBarWidthToAspectRadio / 10));
//     }
//     return ((2 - widthFactorToProgressBarWidthToAspectRadio / 10) + 0.3);
//   }
// }

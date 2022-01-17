import 'dart:io';

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

enum TypeOfImageToAvatar { kAsset, kWeb, kFile }

class CircleAvatarECA extends StatelessWidget {
  final double radius;
  final Color borderColor;
  final Color backgroundColor;
  final String imageURL;
  final TypeOfImageToAvatar typeOfImageToAvatar;
  final BoxFit? boxFit;
  final double? width;
  final double? height;

  const CircleAvatarECA({
    Key? key,
    this.radius = 32,
    this.borderColor = Colors.white38,
    this.backgroundColor = Colors.transparent,
    required this.imageURL,
    this.typeOfImageToAvatar = TypeOfImageToAvatar.kAsset,
    this.boxFit,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius * 1,
      backgroundColor: borderColor,
      child: CircleAvatar(
          radius: radius * 0.95,
          backgroundColor: backgroundColor,
          foregroundImage: _buildAvatarImage()),
    );
  }

  _buildAvatarImage() {
    if (typeOfImageToAvatar == TypeOfImageToAvatar.kAsset) {
      return Image.asset(
        imageURL,
        fit: boxFit ?? BoxFit.fill,
        width: width ?? 210,
        height: height ?? 210,
      ).image;
    } else if (typeOfImageToAvatar == TypeOfImageToAvatar.kFile) {
      return Image.file(
        File(imageURL),
        fit: boxFit ?? BoxFit.fill,
        width: width ?? 210,
        height: height ?? 210,
      ).image;
    }

    return FadeInImage.memoryNetwork(
      fit: boxFit ?? BoxFit.fill,
      width: width ?? 210,
      placeholder: kTransparentImage,
      image: imageURL,
      height: height ?? 210,
    ).image;
  }
}

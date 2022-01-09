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

  const CircleAvatarECA({
    Key? key,
    this.radius = 32,
    this.borderColor = Colors.white38,
    this.backgroundColor = Colors.transparent,
    required this.imageURL,
    this.typeOfImageToAvatar = TypeOfImageToAvatar.kAsset,
  }) : super(key: key);

  _buildAvatarImage() {
    if (typeOfImageToAvatar == TypeOfImageToAvatar.kAsset) {
      return Image.asset(
        imageURL,
        fit: BoxFit.fill,
      ).image;
    } else if (typeOfImageToAvatar == TypeOfImageToAvatar.kFile) {
      return Image.file(
        File(imageURL),
        fit: BoxFit.fill,
      ).image;
    }

    return FadeInImage.memoryNetwork(
      fit: BoxFit.fitWidth,
      width: 210,
      placeholder: kTransparentImage,
      image: imageURL,
    ).image;
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius * 1.1,
      backgroundColor: borderColor,
      child: CircleAvatar(
          radius: radius * 0.95,
          backgroundColor: backgroundColor,
          foregroundImage: _buildAvatarImage()),
    );
  }
}

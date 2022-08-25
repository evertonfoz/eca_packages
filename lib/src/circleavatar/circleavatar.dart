import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:eca_packages/eca_packages.dart';
import 'package:flutter/material.dart';

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

    return Image(
      key: UniqueKey(),
      image: CachedNetworkImageProvider(
        imageURL,
        maxWidth: (width ?? 210).toInt(),
        maxHeight: (height ?? 210).toInt(),
      ),
    ).image;
  }
}

Widget buildCircleAvatar({
  String? avatar,
  required double radius,
  Color borderColor = Colors.black,
  String noProfileImage = kNoProfileImage,
}) {
  TypeOfImageToAvatar typeOfImageToAvatar;
  if (avatar != null && (avatar.startsWith('assets') || avatar == '')) {
    typeOfImageToAvatar = TypeOfImageToAvatar.kAsset;
  } else if (avatar != null && avatar.contains('https')) {
    typeOfImageToAvatar = TypeOfImageToAvatar.kWeb;
  } else {
    typeOfImageToAvatar = TypeOfImageToAvatar.kFile;
  }
  return CircleAvatarECA(
    typeOfImageToAvatar: typeOfImageToAvatar,
    imageURL: avatar == null || avatar.isEmpty ? noProfileImage : avatar,
    radius: radius,
    boxFit: BoxFit.fitHeight,
    borderColor: borderColor,
    // backgroundColor: kBrandColor,
  );
}

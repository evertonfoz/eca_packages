// ignore_for_file: must_be_immutable

import 'dart:io';

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
  dynamic placeHolderImage;
  // final bool useCachedImage;

  CircleAvatarECA({
    Key? key,
    this.radius = 32,
    this.borderColor = Colors.white38,
    this.backgroundColor = Colors.transparent,
    required this.imageURL,
    this.typeOfImageToAvatar = TypeOfImageToAvatar.kAsset,
    this.boxFit,
    this.width,
    this.height,
    this.placeHolderImage,

    // this.useCachedImage = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius * 1,
      backgroundColor: borderColor,
      child: CircleAvatar(
          radius: radius * 0.95,
          backgroundImage: placeHolderImage == null
              ? placeHolderImage
              : Image.asset(
                  placeHolderImage,
                  fit: boxFit ?? BoxFit.fill,
                  width: width ?? 210,
                  height: height ?? 210,
                ).image,
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

    if (placeHolderImage != null) {
      return FadeInImage.assetNetwork(
        image: imageURL,
        placeholder: placeHolderImage,
        width: width ?? 210,
        // placeholderCacheHeight: 200,
        height: height ?? 210,
        fit: boxFit,
      ).image;
    }

    return Image.network(
      imageURL,
      width: width ?? 210,
      height: height ?? 210,
      fit: boxFit,
    ).image;
  }
}

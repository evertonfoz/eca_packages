import 'dart:typed_data';

import 'package:eca_packages/eca_packages.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

Widget buildCircleAvatar({
  String? avatar,
  required double radius,
  Color borderColor = Colors.black,
  String noProfileImage = kNoProfileImage,
  dynamic? placeHolderImage,
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
    // useCachedImage: useCachedImage,
    // backgroundColor: kBrandColor,
  );
}

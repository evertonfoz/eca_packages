import 'package:flutter/material.dart';

class WelcomePageBackgroundImage extends StatelessWidget {
  final String imageURL;

  const WelcomePageBackgroundImage({
    Key? key,
    required this.imageURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            imageURL,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

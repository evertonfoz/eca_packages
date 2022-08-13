import 'package:cached_network_image/cached_network_image.dart';
import 'package:eca_packages/eca_packages.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSliderImages extends StatefulWidget {
  final Color borderColor;
  final String imageField;
  final MaterialColor loadingColor;

  const CarouselSliderImages({
    Key? key,
    required this.photos,
    required this.borderColor,
    required this.imageField,
    required this.loadingColor,
  }) : super(key: key);

  final List<dynamic> photos;

  @override
  State<CarouselSliderImages> createState() => _CarouselSliderImagesState();
}

class _CarouselSliderImagesState extends State<CarouselSliderImages> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.max, children: [
      Expanded(
        child: CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
              height: MediaQuery.of(context).size.height * 0.95),
          items: widget.photos.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(color: widget.borderColor),
                    child: CachedNetworkImage(
                      // width: 100,
                      // height: 100,
                      fit: BoxFit.cover,
                      imageUrl: i[widget.imageField],
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              IndicatorProcessingCircularTextAndGif(
                        loadingColor: widget.loadingColor,
                        texts: const [
                          'aguarde',
                          'recuperando',
                          'imagem'
                        ], //['${downloadProgress.downloaded}'],
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.photos.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 12.0,
              height: 12.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : widget.borderColor)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4)),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}

import 'package:flutter/material.dart';

class WelcomePageDotsIndicator extends StatelessWidget {
  final int totalOfPage;
  final int currentPage;
  final MaterialColor color;

  const WelcomePageDotsIndicator({
    Key? key,
    required this.totalOfPage,
    required this.currentPage,
    this.color = Colors.indigo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            totalOfPage,
            (index) => _buildDot(index: index),
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  AnimatedContainer _buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? color.shade500 : color.shade300,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

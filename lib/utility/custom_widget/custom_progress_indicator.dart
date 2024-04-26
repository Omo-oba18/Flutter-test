import 'package:flutter/material.dart';
import 'package:test_project/extensions/context_extenstions.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({
    super.key,
    required this.totalWidth,
    required this.currentIndex,
    required this.carouselListLength,
  });

  final double totalWidth;
  final int currentIndex;
  final int carouselListLength;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProgressContainer(
          width: totalWidth * ((currentIndex) / carouselListLength) + 11,
        ),
        ProgressContainer(
          width:
              totalWidth * (1 - ((currentIndex + 1) / carouselListLength)) + 11,
        ),
      ],
    );
  }
}

class ProgressContainer extends StatelessWidget {
  final double width;

  const ProgressContainer({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      duration: const Duration(milliseconds: 200),
      curve: standardEasing,
      height: context.mqSize.height * 0.0068,
      width: width,
      decoration: const BoxDecoration(
          color: Color(0xff357aff),
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:test_project/extensions/context_extenstions.dart';

class CarouselItem extends StatelessWidget {
  final String upperText;
  final String imageName;
  final String lowerText;

  const CarouselItem({
    super.key,
    required this.upperText,
    required this.imageName,
    required this.lowerText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          upperText,
          textAlign: TextAlign.center,
          style: context.textTheme.bodySmall,
        ),
        SizedBox(
          height: context.mqSize.height * 0.03,
        ),
        Image.asset(
          'assets/images/$imageName.jpg',
          height: context.mqSize.height * 0.28,
        ),
        SizedBox(
          height: context.mqSize.height * 0.03,
        ),
        Text(
          lowerText,
          textAlign: TextAlign.center,
          style: context.textTheme.bodySmall,
        ),
      ],
    );
  }
}

class CarouselModel {
  final String upperText;
  final String imageName;
  final String lowerText;

  CarouselModel({
    required this.upperText,
    required this.imageName,
    required this.lowerText,
  });
}

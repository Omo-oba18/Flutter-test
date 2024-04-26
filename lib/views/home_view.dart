import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:test_project/extensions/context_extenstions.dart';
import 'package:test_project/utility/custom_widget/carousel_item.dart';
import 'package:test_project/utility/custom_widget/gradient_button.dart';
import 'package:test_project/utility/custom_widget/custom_progress_indicator.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final CarouselController _carouselController;
  int currentIndex = 0;
  final List<CarouselModel> carouselList = [
    CarouselModel(
      upperText: 'Un budget défini',
      imageName: 'im1',
      lowerText: 'totalement maîtrisé !',
    ),
    CarouselModel(
      upperText: 'Commander un artisan',
      imageName: 'im2',
      lowerText: 'et faites vous dépanner',
    ),
    CarouselModel(
      upperText: 'Le dépannage facile \nrapide',
      imageName: 'im3',
      lowerText: 'et enfin abordable !',
    ),
  ];

  @override
  void initState() {
    _carouselController = CarouselController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double totalWidth = context.mqSize.width * 0.12;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Layout Code
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset('assets/images/dehaut.png'),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset('assets/images/degauche.png'),
          ),
          // Body Code
          SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: context.mqSize.height * 0.12,
                ),
                Text(
                  'Stemir',
                  style: context.textTheme.bodyLarge,
                ),
                SizedBox(
                  height: context.mqSize.height * 0.04,
                ),
                CarouselSlider.builder(
                  carouselController: _carouselController,
                  itemCount: carouselList.length,
                  itemBuilder: (context, index, realIndex) {
                    return CarouselItem(
                      upperText: carouselList[index].upperText,
                      imageName: carouselList[index].imageName,
                      lowerText: carouselList[index].lowerText,
                    );
                  },
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    scrollPhysics: const NeverScrollableScrollPhysics(),
                    autoPlay: false,
                    enlargeCenterPage: false,
                    viewportFraction: 1,
                    aspectRatio: 0.94,
                    initialPage: 0,
                    enableInfiniteScroll: false,
                    disableCenter: true,
                  ),
                ),
                // Progress Indicator
                CustomProgressIndicator(
                  totalWidth: totalWidth,
                  currentIndex: currentIndex,
                  carouselListLength: carouselList.length,
                ),
                SizedBox(
                  height: context.mqSize.height * 0.02,
                ),
                GradientButton(
                  onPressed: () {
                    _carouselController.animateToPage(
                        (currentIndex + 1) % carouselList.length);
                  },
                  text: 'Next',
                  gradient: const LinearGradient(
                    colors: [Color(0xff44cef6), Color(0xff3a43c6)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

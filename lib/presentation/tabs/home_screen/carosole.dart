import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarasoleSlider extends StatefulWidget {
  const CarasoleSlider({super.key});

  @override
  State<CarasoleSlider> createState() => _CarasoleSliderState();
}

class _CarasoleSliderState extends State<CarasoleSlider> {
  List imageList = [
    {"id": 1, "image_path": 'https://cdn0.desidime.com/SEO/1200-by-675-ddAJIO-seo-image.png'},
    {"id": 2, "image_path": 'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/luxury-watch-sale-ad-design-template-cf293a66c25e92f374462fc5b6e3b69f_screen.jpg?ts=1636520156'},
    {"id": 3, "image_path": 'https://img.paisawapas.com/ovz3vew9pw/2022/07/04184530/aj.jpg'}
  ];

  final CarouselSliderController  carousel= CarouselSliderController();
  // final CarasoleSliderCon carousel = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Column(children: [
      CarouselSlider(
        items: imageList.map((item) => Container(
          padding: const EdgeInsets.all(8.0), // Add padding to the container
          height: height * 0.4,
          width: double.infinity,
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(5.0), // Add padding inside the image container
              decoration: BoxDecoration(
                color: Colors.red, // Background color for the container
                borderRadius: BorderRadius.circular(8.0), // Rounded corners
              ),
              child: Image.network(
                item['image_path'],
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ),
          ),
        )).toList(),
        carouselController: carousel,
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2,
          viewportFraction: 1.0,
          onPageChanged: (index, reason) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
      SizedBox(height: height * 0.02),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imageList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => carousel.animateToPage(entry.key),
            child: Container(
              width: currentIndex == entry.key ? 25 : 25,
              height: height * 0.004,
              margin: const EdgeInsets.symmetric(horizontal: 3.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: currentIndex == entry.key ? Colors.red : Colors.teal,
              ),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}

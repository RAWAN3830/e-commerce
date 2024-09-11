import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarauselSlider extends StatefulWidget {
  final String image;
  final String lable;
  final String subTitle;

  const CarauselSlider({
    required this.image,
    required this.lable,
    required this.subTitle,
    super.key,
  });

  @override
  State<CarauselSlider> createState() => _CarauselSliderState();
}

class _CarauselSliderState extends State<CarauselSlider> {
  @override
  Widget build(BuildContext context) {
    int current = 0;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return CarouselSlider.builder(
      itemCount: 4,
      options: CarouselOptions(
        height: height * 0.2,
        autoPlay: true,
        clipBehavior: Clip.antiAlias,
        animateToClosest: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        // linearToEaseOut,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 500),
        viewportFraction: 1,
        onPageChanged: (index, reason) {
          setState(() {
            current = index;
          });
        },
      ),
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: height * 0.2,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green,
                border: Border.all(color: Colors.white70,width: 1),
              boxShadow:const [BoxShadow(color: Colors.black54,offset:Offset(3,2),spreadRadius:-2,blurRadius: 20)],
             )),
        );
      },
    );
  }
}

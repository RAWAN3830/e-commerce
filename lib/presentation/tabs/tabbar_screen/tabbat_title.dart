import 'package:flutter/material.dart';

class TabbarTitle extends StatelessWidget {
  final String imagePath;
  final String title;
  const TabbarTitle({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final tabCircle = height * 0.02;
    return Row(
      children: [
        CircleAvatar(
            //backgroundColor: Colors.red,
            radius: tabCircle,
             foregroundImage: NetworkImage(imagePath)),
        SizedBox(
          width: width * 0.02,
        ),
        Text(title)
      ],
    );
  }
}

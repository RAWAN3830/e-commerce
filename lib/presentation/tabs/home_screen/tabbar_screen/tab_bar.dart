import 'package:e_commerce/presentation/tabs/home_screen/first.dart';
import 'package:e_commerce/presentation/tabs/home_screen/second.dart';
import 'package:flutter/material.dart';

import '../registration/common_widgets/tabbat_title.dart';
import 'home_screen/home_screen.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  // late TabController tabController;
  @override
  // void initState() {
  //   tabController = TabController(length: 4, vsync: this);
  //   tabController.addListener(() {
  //     setState(() {});
  //   });
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    final tabCircle = _height * 0.02;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            //tabcontroller.index can be used to get the name of current index value of the tabview.
            title: Text('hello'),
            bottom: TabBar(tabs: [
              Tab(icon: Icon(Icons.home,size: _height*0.04,),),
              TabbarTitle(imagePath: 'https://assets.ajio.com/medias/sys_master/images/images/h3b/h6f/50046445912094/Top-banner-carousel-banner-4.jpg', title: 'title'),
              TabbarTitle(imagePath: 'https://i.pinimg.com/564x/70/e4/9c/70e49c4a2ea8af1f538cd0ea2c505db9.jpg', title: 'title'),
              TabbarTitle(imagePath: 'https://www.watchesofswitzerland.com/medias/SeastarPro-685x700.jpg?context=bWFzdGVyfHJvb3R8MTQ2ODkwfGltYWdlL2pwZWd8YURsa0wyZzFaUzg1TVRFek1qWTBPRFE0T1RJMkxtcHdad3xkODc4NjlmYzgzYWM4NDhhM2RmN2VlZTFlMjRkNWI2YmUwOGYwMGUxYTRlYzNiZjI1NGE3MDY4MjUxY2UxZTAz&imwidth=960', title: 'title'),

            ]),
          ),
          body: TabBarView( children: [
            homeScreen(),
            second(),
            first(),
            second(),
            // second(),


          ])),
    );
  }
}


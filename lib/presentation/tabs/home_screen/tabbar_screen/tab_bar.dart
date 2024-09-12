import 'package:e_commerce/presentation/tabs/home_screen/tabbar_screen/tabbat_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/provider/api_provider.dart';
import '../../../registration/login_screen.dart';
import '../home_screen.dart';
import '../second.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);
  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    Provider.of<ApiProvider>(context, listen: false).providerCategory();
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final searchControlloer = TextEditingController();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
          appBar: AppBar(
//backgroundColor: Colors.white,
            title: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: height * 0.05,
                      width: width * 0.65,
                      child: Material(
                        elevation: 3,
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xffeaf4f4),
                        child: TextField(
                          onSubmitted: (value) {
                            searchControlloer.text = value;
                            // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MyHomePage(title: searchController.text),), (route) => false);
                          },
                          controller: searchControlloer,
                          style: const TextStyle(color: Colors.black),
                          maxLines: 1,
                          decoration: InputDecoration(
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            icon: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CircleAvatar(
                                  radius: height * 0.015,
                                  backgroundImage:
                                      const AssetImage('assets/splash.png')),
                            ),
                            suffixIcon: Icon(
                              CupertinoIcons.camera,
                              size: height * 0.02,
                              color: Colors.grey,
                            ),
                            hintText: "Search by Product",
                          ),
                        ),
                      ),
                    ),
                    Consumer<ApiProvider>(
                      builder: (context,values,child) {
                        return Switch(
                            value: values.getTheme,
                            onChanged: (value) {
                              values.setTheme = value;
                            });
                      }
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.heart,
                        size: height * 0.03,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            bottom: TabBar(tabs: [
              Tab(
                  icon: Icon(
                Icons.home,
                size: height * 0.03,
              )),
              const TabbarTitle(
                  imagePath:
                      'https://assets.ajio.com/medias/sys_master/images/images/h3b/h6f/50046445912094/'
                      'Top-banner-carousel-banner-4.jpg',
                  title: 'title'),
              const TabbarTitle(
                  imagePath:
                      'https://i.pinimg.com/564x/70/e4/9c/70e49c4a2ea8af1f538cd0ea2c505db9.jpg',
                  title: 'title'),
              const TabbarTitle(
                  imagePath:
                      'https://i.pinimg.com/564x/70/e4/9c/70e49c4a2ea8af1f538cd0ea2c505db9.jpg',
                  title: 'title'),
            ]),
          ),
          body: const TabBarView(children: [
             MainHomeScreen(),
            LoginScreen(),
            // first(id: '',),
            second(),
            second(),
            // second(),
          ],

          ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue, // Adjust the active icon color
          unselectedItemColor: Colors.grey, // Adjust the inactive icon color
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),),
    );
  }
}

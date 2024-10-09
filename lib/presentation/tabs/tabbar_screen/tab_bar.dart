import 'package:e_commerce/core/constant/extension.dart';
import 'package:e_commerce/presentation/registration/login_screen.dart';
import 'package:e_commerce/presentation/tabs/cart_screen/cart_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 import 'package:provider/provider.dart';
import '../../../infra/provider/api_provider.dart';
import '../../../infra/provider/auth_provider.dart';
import '../category_screen/category_screen.dart';
import '../home_screen/home_screen.dart';
import '../profile_screen/order_details_screen.dart';
import '../profile_screen/profile_screen.dart';



class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);
  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  int _selectedIndex = 0;
  final searchController = TextEditingController();
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

  Widget _body(){
    switch (_selectedIndex){
      case 0:
        return const  MainHomeScreen();
      case 1:
        return const CategoriesScreen();
      case 2:
        return const CartScreen();
      default:
        return const ProfileScreen();
    }
  }
  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(

          // backgroundColor: Colors.red,
          title: Consumer<ApiProvider>(
            builder: (context,value,child) {
              return Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: height * 0.05,
                        width: width * 0.8,
                        child: Material(
                          elevation: 3,
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xffeaf4f4),
                          child: TextField(
                            onSubmitted: (value) {
                              searchController.text = value;
                              // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MyHomePage(title: searchController.text),), (route) => false);
                            },
                            controller: searchController,
                            style: const TextStyle(color: Colors.black),
                            maxLines: 1,
                            decoration: InputDecoration(
                              hintStyle: const TextStyle(color: Colors.black38),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              icon: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: CircleAvatar(
                                    radius: height * 0.017,
                                    backgroundImage:
                                    const AssetImage('assets/splash.png')),
                              ),
                              suffixIcon: Icon(
                                CupertinoIcons.camera,
                                size: height * 0.022,
                                color: Colors.black54,
                              ),
                              hintText: "Search by Product",
                            ),
                          ),
                        ),
                      ),

                      IconButton(
                        onPressed: () {
                          setState(() {
                            Provider.of<AuthProvider>(context).signOutUser();
                            context.pushAndRemoveUntil(context, target: const LoginScreen());
                          });
                        },
                        icon: Icon(
                          CupertinoIcons.heart,
                          color: value.isTheme ?Colors.lightGreen:Colors.black ,
                          size: height * 0.03,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
          ),
        ),
        body:_body(),

        bottomNavigationBar: BottomNavigationBar(
          // backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blueAccent, // Adjust the active icon color
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
        ),
      ),
    );
  }
}



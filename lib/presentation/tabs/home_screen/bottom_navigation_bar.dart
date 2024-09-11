// import 'package:flutter/material.dart';
//
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _currentIndex = 0;
//   final List<Widget> _screens = [
//   Container(
//       color: Colors.blueAccent,
//     ),
//     Container(
//       color: Colors.redAccent,
//     ),
//     Container(
//       color: Colors.orangeAccent,
//     ),
//
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My App'),
//       ),
//       body: _screens[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings',
//           ),
//         ],
//       ),
//     );
//   }
// }
// //
// // class HomeScreen extends StatelessWidget {
// //   const HomeScreen({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return const Center(
// //       child: Text('Home Screen'),
// //     );
// //   }
// // }
// //
// // class ProfileScreen extends StatelessWidget {
// //   const ProfileScreen({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return const Center(
// //       child: Text('Profile Screen'),
// //     );
// //   }
// // }
// //
// // class SettingsScreen extends StatelessWidget {
// //   const SettingsScreen({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return const Center(
// //       child: Text('Settings Screen'),
// //     );
// //   }
// // }
// // // import 'package:bottom_navy_bar/bottom_navy_bar.dart';
// // import 'package:flutter/material.dart';
// //
// // class MyNevBar extends StatefulWidget {
// //   @override
// //   _MyNevBarState createState() => _MyNevBarState();
// // }
// //
// // class _MyNevBarState extends State<MyNevBar>
// // {
// //   int currentIndex = 0;
// //
// //   List listOfColors = [
// //     Container(
// //       color: Colors.blueAccent,
// //     ),
// //     Container(
// //       color: Colors.redAccent,
// //     ),
// //     Container(
// //       color: Colors.orangeAccent,
// //     ),
// //     Container(
// //       color: Colors.cyanAccent,
// //     )
// //   ];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(
// //           'Animated NavBar',
// //           style: TextStyle(
// //             color: Colors.cyanAccent,
// //           ),
// //         ),
// //         backgroundColor: Colors.red,
// //       ),
// //       body: listOfColors[currentIndex],
// //
// //       bottomNavigationBar: BottomNavyBar(
// //         selectedIndex: currentIndex,
// //         onItemSelected: (index){
// //           setState(() {
// //             currentIndex = index;
// //           });
// //         },
// //         items: <BottomNavyBarItem>[
// //           BottomNavyBarItem(
// //             icon: Icon(Icons.home),
// //             title: Text('Home'),
// //           ),
// //           BottomNavyBarItem(
// //             icon: Icon(Icons.circle_notifications),
// //             title: Text('Notification'),
// //           ),
// //           BottomNavyBarItem(
// //             icon: Icon(Icons.message),
// //             title: Text('Chat'),
// //           ),
// //           BottomNavyBarItem(
// //             icon: Icon(Icons.person),
// //             title: Text('Profile'),
// //             activeColor: Colors.blueAccent,
// //             inactiveColor: Colors.lightGreenAccent,
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// // // import 'package:flutter/cupertino.dart';
// // // import 'package:flutter/material.dart';
// // //
// // // class BottomBar extends StatefulWidget {
// // //   const BottomBar({super.key});
// // //
// // //   @override
// // //   State<BottomBar> createState() => _BottomBarState();
// // // }
// // //
// // // class _BottomBarState extends State<BottomBar> {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text('BottomNavigationBar Demo'),
// // //       ),
// // //       bottomNavigationBar: BottomNavigationBar(
// // //         backgroundColor: Colors.blueAccent,
// // //         elevation: 0,
// // //         iconSize: 40,
// // //         mouseCursor: SystemMouseCursors.grab,
// // //         selectedFontSize: 20,
// // //         selectedIconTheme: IconThemeData(color: Colors.amberAccent, size: 40),
// // //         selectedItemColor: Colors.amberAccent,
// // //         selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
// // //         currentIndex: _selectedIndex,
// // //         unselectedIconTheme: IconThemeData(
// // //           color: Colors.deepOrangeAccent,
// // //         ),
// // //         unselectedItemColor: Colors.deepOrangeAccent,
// // //         onTap: _onItemTapped,
// // //         items: const <BottomNavigationBarItem>[
// // //           BottomNavigationBarItem(
// // //             icon: Icon(Icons.email),
// // //             label: 'Emails',
// // //           ),
// // //           BottomNavigationBarItem(
// // //             icon: Icon(Icons.camera),
// // //             label: 'Camera',
// // //           ),
// // //           BottomNavigationBarItem(
// // //             icon: Icon(Icons.chat),
// // //             label: 'Chats',
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //     void _onItemTapped(int index) {
// // //       setState(() {
// // //         _selectedIndex = index;
// // //       });
// // //     }
// // //   }
// // // }
// //
// //
// // // import 'package:flutter/material.dart';
// // //
// // // void main() => runApp(MyApp());
// // //
// // // /// This Widget is the main application widget.
// // // class MyApp extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       home: MyNavigationBar (),
// // //     );
// // //   }
// // // }
// // //
// // // class MyNavigationBar extends StatefulWidget {
// // //   MyNavigationBar ({Key key}) : super(key: key);
// // //
// // //   @override
// // //   _MyNavigationBarState createState() => _MyNavigationBarState();
// // // }
// // //
// // // class _MyNavigationBarState extends State<MyNavigationBar > {
// // //   int _selectedIndex = 0;
// // //   static const List<Widget> _widgetOptions = <Widget>[
// // //     Text('Home Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
// // //     Text('Search Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
// // //     Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
// // //   ];
// // //
// // //   void _onItemTapped(int index) {
// // //     setState(() {
// // //       _selectedIndex = index;
// // //     });
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //           title: const Text('Flutter BottomNavigationBar Example'),
// // //           backgroundColor: Colors.green
// // //       ),
// // //       body: Center(
// // //         child: _widgetOptions.elementAt(_selectedIndex),
// // //       ),
// // //       bottomNavigationBar: BottomNavigationBar(
// // //           items: const <BottomNavigationBarItem>[
// // //             BottomNavigationBarItem(
// // //                 icon: Icon(Icons.home),
// // //                 title: Text('Home'),
// // //                 backgroundColor: Colors.green
// // //             ),
// // //             BottomNavigationBarItem(
// // //                 icon: Icon(Icons.search),
// // //                 title: Text('Search'),
// // //                 backgroundColor: Colors.yellow
// // //             ),
// // //             BottomNavigationBarItem(
// // //               icon: Icon(Icons.person),
// // //               title: Text('Profile'),
// // //               backgroundColor: Colors.blue,
// // //             ),
// // //           ],
// // //           type: BottomNavigationBarType.shifting,
// // //           currentIndex: _selectedIndex,
// // //           selectedItemColor: Colors.black,
// // //           iconSize: 40,
// // //           onTap: _onItemTapped,
// // //           elevation: 5
// // //       ),
// // //     );
// // //   }
// // //}
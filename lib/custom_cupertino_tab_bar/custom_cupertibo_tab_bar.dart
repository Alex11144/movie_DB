// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:project_from_amirali/Cards/bottomAppBarIcons.dart';

// class CustomCupertinoTabBarWidget extends StatefulWidget {
//   const CustomCupertinoTabBarWidget({Key? key}) : super(key: key);

//   @override
//   State<CustomCupertinoTabBarWidget> createState() =>
//       _CustomCupertinoTabBarWidgetState();
// }

// class _CustomCupertinoTabBarWidgetState
//     extends State<CustomCupertinoTabBarWidget> {
//   int _selectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: const Color(0xFFE31E24),
//       ),
//       child: BottomAppBar(
//         elevation: 0,
//         color: Colors.transparent,
//         child: SizedBox(
//           height: 50,
//           width: MediaQuery.of(context).size.width,
//           child: Padding(
//             padding: EdgeInsets.only(left: 25, right: 25),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 BottomPieces(
//                   text: 'Home',
//                   icon: Icons.home,
//                   selected: _selectedIndex == 0,
//                   onTap: () {
//                     setState(() {
//                       _selectedIndex = 0;
//                     });
//                   },
//                 ),
//                 BottomPieces(
//                   text: 'Home',
//                   icon: Icons.home,
//                   selected: _selectedIndex == 1,
//                   onTap: () {
//                     setState(() {
//                       _selectedIndex = 1;
//                     });
//                   },
//                 ),
//                 BottomPieces(
//                   text: 'Home',
//                   icon: Icons.home,
//                   selected: _selectedIndex == 2,
//                   onTap: () {
//                     setState(() {
//                       _selectedIndex = 2;
//                     });
//                   },
//                 ),
//                 BottomPieces(
//                   text: 'Home',
//                   icon: Icons.home,
//                   selected: _selectedIndex == 3,
//                   onTap: () {
//                     setState(() {
//                       _selectedIndex = 3;
//                     });
//                   },
//                 ),
//                 BottomPieces(
//                   text: 'Home',
//                   icon: Icons.home,
//                   selected: _selectedIndex == 4,
//                   onTap: () {
//                     setState(() {
//                       _selectedIndex = 4;
//                     });
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class BottomPieces extends StatelessWidget {
//   final String text;
//   final IconData icon;
//   final bool selected;
//   final void Function()? onTap;
//   const BottomPieces(
//       {super.key,
//       required this.text,
//       required this.icon,
//       required this.selected,
//       this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         IconButton(
//             onPressed: onTap,
//             icon: Icon(
//               icon,
//               size: 25,
//               color:
//                   selected ? Color.fromARGB(215, 190, 206, 203) : Colors.white,
//             )),
//         Text(
//           text,
//           style: TextStyle(
//               fontSize: 12,
//               height: 1,
//               color:
//                   selected ? Color.fromARGB(215, 190, 206, 203) : Colors.white),
//         )
//       ],
//     );
//   }
// }

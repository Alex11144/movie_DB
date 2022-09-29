
// CupertinoTabScaffold(
//       tabBar: CupertinoTabBar(
//           backgroundColor: Colors.red,
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.home_outlined,
//                   color: Colors.white,
//                 ),
//                 label: ("Bas sehife"),
//                 backgroundColor: Colors.white),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.search_outlined,
//                 color: Colors.white,
//               ),
//               label: ("Axtaris"),
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.shopping_bag_outlined,
//                 color: Colors.white,
//               ),
//               label: ("Mehsullar"),
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.favorite_outline,
//                 color: Colors.white,
//               ),
//               label: ("Secilmisdir"),
//             ),
//             BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.settings_outlined,
//                   color: Colors.white,
//                 ),
//                 label: ("Ayarlar")),
//           ]),
//       tabBuilder: (context, index) {
//         CupertinoTabView(
          
//           builder: (context) {
//             CupertinoPageScaffold(child: );
//             switch (index) {
//               case 0:
//                 return Shop();
//               case 1:
//                 return Hicabs();
             
//               default:
//                 return Shop();
//             }
//           },
//         );
//         return Shop();
//       },
//     );



//  Scaffold(
//         body: IndexedStack(
//           index: CurrentIndex,
//           children: screens,
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           unselectedItemColor: Colors.white,
//           selectedItemColor: Colors.white,
//           type: BottomNavigationBarType.fixed,
//           backgroundColor: Colors.red,
//           currentIndex: CurrentIndex,
//           items: [
//             BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.home_outlined,
//                   color: Colors.white,
//                 ),
//                 label: ("Bas sehife"),
//                 backgroundColor: Colors.white),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.search_outlined,
//                 color: Colors.white,
//               ),
//               label: ("Axtaris"),
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.shopping_bag_outlined,
//                 color: Colors.white,
//               ),
//               label: ("Mehsullar"),
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.favorite_outline,
//                 color: Colors.white,
//               ),
//               label: ("Secilmisdir"),
//             ),
//             BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.settings_outlined,
//                   color: Colors.white,
//                 ),
//                 label: ("Ayarlar")),
//           ],
//           onTap: (index) {
//             setState(() {
//               CurrentIndex = index;
//             });
//           },
//         ));
import 'package:flutter/material.dart';
import 'package:the_movie_db/widgets/movie_list/movie_list_widget.dart';

class MainScreenWidget extends StatefulWidget {
  MainScreenWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int initialIndex = 0;
  final screens = [const Text('News'), const MovieListWiget(), const Text('Series')];
  void SelectedTab(int index) {
    if (initialIndex == index) return;
    setState(() {
      initialIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         setState(() {
        //           if (hide == true) {
        //             hide = false;
        //           } else if (hide == false) {
        //             hide = true;
        //           }
        //         });
        //       },
        //       icon: Icon(Icons.search))
        // ],
        title: const Center(child: Text('TMDB')),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: initialIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'News'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Films'),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'Series'),
        ],
        onTap: SelectedTab,
      ),
      body: IndexedStack(index: initialIndex, children: screens),
    );
  }
}

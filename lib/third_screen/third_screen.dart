import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:the_movie_db/Theme/app_colors.dart';
import 'package:the_movie_db/src/api/movies_api.dart';
import 'package:the_movie_db/widgets/movie_list/movie_list_widget.dart';

class Model1 extends ChangeNotifier {
  bool _hide = false;
  bool get hide1 => _hide;
  ScrollController _controller = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  var _filteredMovies = <Movie>[];

  void _searchMovies() {
    final query = _searchController.text;

    if (query.isNotEmpty) {
      _filteredMovies = movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredMovies = movies;
    }
    notifyListeners();
  }

  void _searchHider() {
    if (_hide == true) {
      _hide = false;
    } else if (_hide == false) {
      _hide = true;
    }
    notifyListeners();
  }

  void _onMovieTap(int index, context) {
    final id = movies[index];

    Navigator.of(context).pushNamed('/main_screen/movie_details',
        arguments: {'movies_info': id});
  }

  Model1() {
    _controller.addListener(() {
      _hide = false;
      notifyListeners();
    });
    _filteredMovies = movies;

    _searchController.addListener(_searchMovies);
    notifyListeners();
  }
  // void initState() {
  //   _controller.addListener(() {
  //     hide = false;
  //     notifyListeners();
  //   });
  //   _filteredMovies = movies;

  //   _searchController.addListener(_searchMovies);
  //   notifyListeners();
  // }

  // progress() {
  //   initState();
  // }
}

class ThirdScren extends StatelessWidget {
   ThirdScren({Key? key}) : super(key: key);
  Color color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            // color: Colors.white,
            width: 390,
            height: 840,
            child: Column(
              children: [
                Container(
                  // padding: EdgeInsets.only(top: 100, bottom: 100),
                  // margin: EdgeInsets.only(top: 90, bottom: 90),
                  // height: 30,
                  // width: 84,
                  child: TextButton(
                      onPressed: () => context.read<Model1>()._searchHider(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.search,
                            color: AppColors.mainDarkBlue,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          const Text(
                            'Search',
                            style: TextStyle(
                                color: AppColors.mainDarkBlue, fontSize: 17),
                          )
                        ],
                      )),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      ListView.builder(
                        controller: context.watch<Model1>()._controller,
                        padding: const EdgeInsets.only(top: 10),
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        itemCount:
                            context.watch<Model1>()._filteredMovies.length,
                        itemExtent: 163,
                        itemBuilder: ((context, index) {
                          final movie = movies[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 10),
                            child: Stack(children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.black.withOpacity(0.2)),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 8,
                                          offset: const Offset(0, 2))
                                    ]),
                                clipBehavior: Clip.hardEdge,
                                child: Row(
                                  children: [
                                    Image(image: AssetImage(movie.imageName)),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            movie.title,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            movie.time,
                                            style: const TextStyle(
                                                color: Colors.grey),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            movie.description,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    )
                                  ],
                                ),
                              ),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(10),
                                  onTap: () => context
                                      .read<Model1>()
                                      ._onMovieTap(index, context),
                                ),
                              )
                            ]),
                          );
                        }),
                      ),
                      // hide == true
                      //     ?
                      if (context.read<Model1>()._hide == true)
                        Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                                controller:
                                    context.read<Model1>()._searchController,
                                decoration: InputDecoration(
                                    labelText: 'Search',
                                    filled: true,
                                    fillColor: Colors.white.withAlpha(235),
                                    border: const OutlineInputBorder())))
                    ],
                  ),
                ),
              ],
            )));
  }
}

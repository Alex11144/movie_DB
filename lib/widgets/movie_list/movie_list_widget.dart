import 'package:flutter/material.dart';
import 'package:the_movie_db/Theme/app_colors.dart';
import 'package:the_movie_db/src/api/movies_api.dart';

bool hide = false;

class Movie {
  final int id;
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie(
      {required this.id,
      required this.imageName,
      required this.title,
      required this.time,
      required this.description});
}

class MovieListWidget extends StatefulWidget {
  const MovieListWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  @override
  Color color = Colors.black;

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
    setState(() {});
  }

  void _onMovieTap(int index) {
    final id = movies[index];

    Navigator.of(context).pushNamed('/main_screen/movie_details',
        arguments: {'movies_info': id});
  }

  void initState() {
    _controller.addListener(() {
      setState(() {
        hide = false;
      });
    });
    super.initState();
    _filteredMovies = movies;

    _searchController.addListener(_searchMovies);
  }

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
                      onPressed: () {
                        setState(() {
                          if (hide == true) {
                            hide = false;
                          } else if (hide == false) {
                            hide = true;
                          }
                        });
                      },
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
                        controller: _controller,
                        padding: const EdgeInsets.only(top: 10),
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        itemCount: _filteredMovies.length,
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
                                  onTap: () => _onMovieTap(index),
                                ),
                              )
                            ]),
                          );
                        }),
                      ),
                      // hide == true
                      //     ?
                      if (hide == true)
                        Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                                controller: _searchController,
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

// Center(
//         child: Container(
//             color: Colors.white,
//             width: 390,
//             height: 840,
//             child: Scaffold(
//               backgroundColor: AppColors.mainDarkBlue,
//               body: FutureBuilder<List<Users>>(
//                   future: usersFuture,
//                   builder: (context, snapshot) {
//                     if (snapshot.hasData) {
//                       final users = snapshot.data!;
//                       return buildUsers(users);
//                     } else {
//                       return Text("error");
//                     }
//                   }),
//             )));
//   }
// }

// Widget buildUsers(List<Users> users) => ListView.builder(
//       itemCount: 30,
//       itemExtent: 163,
//       itemBuilder: ((context, index) {
//         final user = users[index];
//         return Card(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//           elevation: 30,
//           child: Container(
//             margin: EdgeInsets.symmetric(vertical: 5),
//             color: Colors.white,
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//               child: Column(
//                 children: [
//                   Text(
//                     user.body,
//                     style: TextStyle(fontSize: 10),
//                   ),
//                   Divider(
//                     thickness: 10,
//                   ),
//                   Text(user.title, style: TextStyle(fontSize: 10)),
//                   Text(user.id.toString())
//                 ],
//               ),
//             ),
//           ),
//         );
//       }),
//     );

// Future<List<Users>> usersFuture = fetchNotes();

// static Future<List<Users>> fetchNotes() async {
//   var url = 'https://jsonplaceholder.typicode.com/posts';
//   final response = await http.get(Uri.parse(url));
//   final body = json.decode(response.body);
//   return body.map<Users>(Users.fromJson).toList();
// }

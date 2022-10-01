import 'package:flutter/material.dart';

import 'package:the_movie_db/widgets/details_screen/movie_details_main_info_screen.dart';
import 'package:the_movie_db/widgets/details_screen/movie_details_main_screencast_widget.dart';

class MovieDetailsWidget extends StatefulWidget {
  final int movieId;

  const MovieDetailsWidget({Key? key, required this.movieId}) : super(key: key);

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('TMDB')),
      ),
      body: Center(
        child: Container(
          height: 840,
          width: 390,
          child: ColoredBox(
            color: const Color.fromRGBO(24, 23, 27, 1.0),
            child: ListView(
              children: [
                const MovieDetailsMainInfoWidget(),
                const SizedBox(
                  height: 30,
                ),
                const MovieDetailsMainScreenCastWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

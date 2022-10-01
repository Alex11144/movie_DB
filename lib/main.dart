import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_movie_db/Theme/app_colors.dart';
import 'package:the_movie_db/counter_mvvm/counter.dart';
import 'package:the_movie_db/second_screen/provider_example.dart';
import 'package:the_movie_db/third_screen/third_screen.dart';

import 'package:the_movie_db/widgets/auth/auth_widget.dart';
import 'package:the_movie_db/widgets/details_screen/movie_details_screen.dart';
import 'package:the_movie_db/widgets/main_screen/main_screen_widget.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => Model()),
    ChangeNotifierProvider(create: (_) => Model1()),
    ChangeNotifierProvider(create: (_) => ViewModel())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/auth': (context) => const AuthWidget(),
        '/main_screen': (context) => MainScreenWidget(),
        '/main_screen/movie_details': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;
          if (arguments is int) {
            return MovieDetailsWidget(
              movieId: arguments,
            );
          } else {
            return const MovieDetailsWidget(movieId: 0);
          }
        },
      },
      title: 'TheMovieDb',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: AppColors.mainDarkBlue),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: AppColors.mainDarkBlue,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey),
      ),
      initialRoute: '/auth',
    );
  }
}

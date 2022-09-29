// import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_from_amirali/favourites/search_for_favorites.dart';

import 'package:project_from_amirali/screens/Cup_bottom_tab.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:project_from_amirali/screens/dini_kitablar/kitab_names_layout/kitab_names_layout.dart';
import 'package:project_from_amirali/useful_classes/hicab_data.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HicabDataAdapter());
  await Hive.openBox<HicabData>('products');
  await Hive.openBox<HicabData>('sepetBox');
  await Hive.openBox('loginBox');
  // await Hicabs.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Change()),
      ChangeNotifierProvider(create: (_) => ListViewState()),
    ],
    child: const BottomNavigationBarWidget(),
  )

      // MaterialApp(routes: {
      //   '/register': (context) => RegistrationWidget(),
      //   '/main_screen': (context) => BottomNavigationBarWidget(),
      //   '/auth': (context) => AuthWidget(),
      //   '/hesab_screen': (context) => HesabWidget(),
      // }, initialRoute: '/main_screen'),
      );
}

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  void dispose() {
    super.dispose();
    Boxes.getTransactions().close();
    SepetBoxes.getTransactions().close();
    LoginBox.getTransactions().close();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // routes: {
        //   '/main_screen': (context) => CupertinoTabWidget(),
        //   '/register': (context) => RegistrationWidget(),
        //   '/auth': (context) => AuthWidget(),
        //   '/hesab_screen': (context) => HesabWidget(),
        // },
        // initialRoute: '/register',
        home:
            // CupertinoTabWidget()
            AnimatedSplashScreen(
                splash: 'assets/images/betulimage.png',
                // splashIconSize: 30000,
                animationDuration: Duration(milliseconds: 1700),
                duration: 2500,
                splashTransition: SplashTransition.scaleTransition,
                nextScreen: CupertinoTabWidget()));
  }
}

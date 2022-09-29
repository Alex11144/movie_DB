import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_from_amirali/details/details_screens.dart';
import 'package:project_from_amirali/favourites/search_for_favorites.dart';
import 'package:project_from_amirali/hesab_screen/auth/auth_widget.dart';
import 'package:project_from_amirali/hesab_screen/auth/registration/register.dart';
import 'package:project_from_amirali/hesab_screen/hesabim.dart';
import 'package:project_from_amirali/screens/Etirler.dart';
import 'package:project_from_amirali/screens/dini_kitablar/dini_kitablar_ui.dart';
import 'package:project_from_amirali/screens/dini_kitablar/kitab_class/kitab_class_api.dart';
import 'package:project_from_amirali/screens/dini_kitablar/listening/listening.dart';
import 'package:project_from_amirali/screens/main_screen.dart';
import 'package:project_from_amirali/screens/search_screen.dart';
import 'package:project_from_amirali/useful_classes/hicab_data.dart';
import 'HicabMehsullari.dart';

class CupertinoTabWidget extends StatefulWidget {
  const CupertinoTabWidget({Key? key}) : super(key: key);

  @override
  State<CupertinoTabWidget> createState() => _CupertinoTabWidgetState();
}

class _CupertinoTabWidgetState extends State<CupertinoTabWidget> {
  var navigatorKeyList = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];
  int currentIndex = 0;
  var controller = CupertinoTabController(initialIndex: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        controller: controller,
        tabBar: CupertinoTabBar(
            backgroundColor: const Color(0xFFE31E24),
            activeColor: Color.fromARGB(215, 190, 206, 203),
            inactiveColor: Colors.white,
            onTap: (index) {
              if (currentIndex == index) {
                // Navigate to the tab's root route
                navigatorKeyList[index].currentState?.popUntil((route) {
                  return route.isFirst;
                });
              }
              currentIndex = index;
            },
            items: const [
              BottomNavigationBarItem(
                label: 'Bas sehife',
                icon: Icon(Icons.home_outlined),
              ),
              BottomNavigationBarItem(
                label: 'Axtaris',
                icon: Icon(Icons.search_outlined),
              ),
              BottomNavigationBarItem(
                label: 'Mehsullar',
                icon: Icon(Icons.shopping_bag_outlined),
              ),
              BottomNavigationBarItem(
                label: 'Secilmisler',
                icon: Icon(Icons.favorite_outline_outlined),
              ),
              BottomNavigationBarItem(
                label: 'Hesabim',
                icon: Icon(Icons.person),
              ),
            ]),
        tabBuilder: ((BuildContext _, int index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                navigatorKey: navigatorKeyList[index],
                routes: {
                  '/': (context) => WillPopScope(
                        child: const Shop(),
                        onWillPop: () => Future<bool>.value(true),
                      ),
                  'hicabs': (context) => HicabsName(),
                  'etirler': (context) => Etir(),
                  'kitablar': (context) => KitablarUI(),
                  '/main_screen': (context) => const Shop(),
                  '/main_screen/movie_details': (context) {
                    final arguments =
                        ModalRoute.of(context)?.settings.arguments;
                    if (arguments is HicabData) {
                      return DetailsScreenForHicabs(product1: arguments);
                    } else {
                      return Container(child : Text('hello'));
                    }
                  },
                  '/main_screen/listen_to_the_book': (context) {
                    final arguments =
                        ModalRoute.of(context)?.settings.arguments;
                    if (arguments is Kitablar ) {
                      return ListenToTheBook(product1: arguments);
                    } else {
                      return Container();
                    }
                  },
                  // 'details': (context) => DetailsScreenForHicabs(),
                },
              );
            case 1:
              return CupertinoTabView(
                navigatorKey: navigatorKeyList[index],
                routes: {
                  '/': (context) => WillPopScope(
                        child: SearchWidget(),
                        onWillPop: () => Future<bool>.value(true),
                      ),
                  '/main_screen': (context) => const Shop(),
                  'register': (context) => const RegistrationWidget(),
                  'auth': (context) => const AuthWidget(),
                  '/main_screen/movie_details': (context) {
                    final arguments =
                        ModalRoute.of(context)?.settings.arguments;
                    if (arguments is HicabData) {
                      return DetailsScreenForHicabs(product1: arguments);
                    } else {
                      return Container();
                    }
                  },
                  '/main_screen/listen_to_the_book': (context) {
                    final arguments =
                        ModalRoute.of(context)?.settings.arguments;
                    if (arguments is Kitablar) {
                      return ListenToTheBook(product1: arguments);
                    } else {
                      return Container();
                    }
                  },
                },
              );
            case 2:
              return CupertinoTabView(
                navigatorKey: navigatorKeyList[index],
                routes: {
                  '/': (context) => WillPopScope(
                        child: HicabsName(),
                        onWillPop: () => Future<bool>.value(true),
                      ),
                  '/main_screen': (context) => const Shop(),
                  'hicabs': (context) => HicabsName(),
                  'etirler': (context) => Etir(),
                  'kitablar': (context) => KitablarUI(),
                  '/main_screen/movie_details': (context) {
                    final arguments =
                        ModalRoute.of(context)?.settings.arguments;
                    if (arguments is HicabData) {
                      return DetailsScreenForHicabs(product1: arguments);
                    } else {
                      return Container();
                    }
                  },
                  '/main_screen/listen_to_the_book': (context) {
                    final arguments =
                        ModalRoute.of(context)?.settings.arguments;
                    if (arguments is Kitablar) {
                      return ListenToTheBook(product1: arguments);
                    } else {
                      return Container();
                    }
                  },
                },
              );

            case 3:
              return CupertinoTabView(
                navigatorKey: navigatorKeyList[index],
                routes: {
                  '/': (context) => WillPopScope(
                        child: const SearchWidgetForHicabs(),
                        onWillPop: () => Future<bool>.value(true),
                      ),
                  '/main_screen': (context) => const Shop(),
                  '/main_screen/movie_details': (context) {
                    final arguments =
                        ModalRoute.of(context)?.settings.arguments;
                    if (arguments is HicabData) {
                      return DetailsScreenForHicabs(product1: arguments);
                    } else {
                      return Container();
                    }
                  },
                  '/main_screen/listen_to_the_book': (context) {
                    final arguments =
                        ModalRoute.of(context)?.settings.arguments;
                    if (arguments is Kitablar) {
                      return ListenToTheBook(product1: arguments);
                    } else {
                      return Container();
                    }
                  },
                },
              );

            case 4:
            default:
              return CupertinoTabView(
                navigatorKey: navigatorKeyList[index],
                routes: {
                  '/': (context) => WillPopScope(
                        child: const HesabWidget(),
                        onWillPop: () => Future<bool>.value(true),
                      ),
                  '/main_screen': (context) => const Shop(),
                  'register': (context) => const RegistrationWidget(),
                  'auth': (context) => const AuthWidget(),
                  'hesab': (context) => const HesabWidget(),
                  '/main_screen/movie_details': (context) {
                    final arguments =
                        ModalRoute.of(context)?.settings.arguments;
                    if (arguments is HicabData) {
                      return DetailsScreenForHicabs(product1: arguments);
                    } else {
                      return Container();
                    }
                  },
                  '/main_screen/listen_to_the_book': (context) {
                    final arguments =
                        ModalRoute.of(context)?.settings.arguments;
                    if (arguments is Kitablar) {
                      return ListenToTheBook(product1: arguments);
                    } else {
                      return Container();
                    }
                  },
                },
              );
          }
        }));
  }
}

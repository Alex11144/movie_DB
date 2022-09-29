import 'package:flutter/material.dart';
import 'package:project_from_amirali/screens/dini_kitablar/kitab_class/kitab_class_api.dart';
import 'package:project_from_amirali/screens/dini_kitablar/kitablar_api/kitablar_api.dart';
import 'package:provider/provider.dart';

class ListViewState extends ChangeNotifier {
  double selectedIndexes = 0;
  double get selectedIndex => selectedIndexes;
  bool listBool1 = true;
  bool get listBool1a => listBool1;
  bool listBool2 = false;
  bool get listBool2a => listBool2;
  bool listBool3 = false;
  bool get listBool3a => listBool3;
  late var product1;
  bool _hide = false;
  bool get hide => _hide;
 void condition() {
    if (listBool1 == true) {
      filteredMovies = kitablar1;
    } else if (listBool2 == true) {
      filteredMovies = kitablar2;
    } else if (listBool3 == true) {
      filteredMovies = kitablar3;
    }
    notifyListeners();
  }

  ScrollController controller = ScrollController();
  TextEditingController searchController = TextEditingController(text: '');
  var filteredMovies = <Kitablar>[];
  var filteredMovies2 = [...kitablar1];

  void listening(int index, context) {
    var details = filteredMovies[index];

    Navigator.of(context)
        .pushNamed('/main_screen/listen_to_the_book', arguments: details);
  }

  void _searchMovies() {
    final query = searchController.text;

    if (query.isNotEmpty) {
      filteredMovies = filteredMovies2.where((Kitablar kitab) {
        return kitab.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      filteredMovies = filteredMovies2;
    }
    notifyListeners();
  }

  void hider() {
    if (_hide == true) {
      _hide = false;
    } else {
      _hide = true;
    }
    notifyListeners();
  }

  ListViewState() {
    controller.addListener(() {
      _hide = false;
      searchController.text = '';
      notifyListeners();
    });
    filteredMovies = filteredMovies2;
    searchController.addListener(_searchMovies);
    notifyListeners();
  }
}

class RowLayout extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  // final double elevation;
  final bool selected;
  const RowLayout(
      {Key? key,
      required this.text,
      required this.onTap,
      required this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listViewState = context.watch<ListViewState>();
    return Material(
      borderRadius: BorderRadius.circular(13),
      elevation: selected ? 15 : 5,
      child: InkWell(
        borderRadius: BorderRadius.circular(13),
        onTap: onTap,
        hoverColor: Colors.grey,
        child: Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: Colors.white,
          ),
          child: Center(
              child: Text(
            text,
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
          )),
        ),
      ),
    );
  }
}

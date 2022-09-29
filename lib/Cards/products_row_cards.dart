import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_from_amirali/Cards/mehsullar.dart';

class ProductsRow extends StatelessWidget {
  const ProductsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Mehsullar(
            text: "Hicablar",
            image: 'assets/images/hicab.png',
            onTap: () {
              // navigatorKey.currentState?.pushNamed('hicabs');
              Navigator.of(context).pushNamed('hicabs');
            },
          ),
          Mehsullar(
            text: ("Etirler"),
            image: 'assets/images/hicab.png',
            onTap: () {
              Navigator.of(context).pushNamed('etirler');
            },
          ),
          Mehsullar(
            text: ("Dini Kitablar"),
            image: 'assets/images/hicab.png',
            onTap: () {
              Navigator.of(context).pushNamed('kitablar');
            },
          ),
          const Mehsullar(text: ("Diger"), image: "assets/images/hicab.png"),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_from_amirali/screens/hicabs.dart';
import 'package:project_from_amirali/useful_classes/hicab_data.dart';

class HicabsName extends StatelessWidget {
  String header = 'Hicablar';

  HicabsName({Key? key}) : super(key: key);
  // final CupertinoTabController controller;
  // final GlobalKey<NavigatorState> navigatorKey;
  // HicabsName( this.controller,  this.navigatorKey);

  @override
  Widget build(BuildContext context) {
    return Hicabs(
      Data: Data1,
      header: header,
      // icon: icon,
    );
  }
}

List<HicabData> Data1 = [
  HicabData(
      ImageAsset: 'assets/images/ApiHicab1.jpg',
      text: 'black hicab',
      Icona: Icon(Icons.favorite_outline_outlined, color: colorRed),
      id: 0,
      price: 12.50,
      count: 1,
      counter: 12.50,
      toplam: 12.50),
  HicabData(
      ImageAsset: 'assets/images/ApiHicab2.png',
      text: 'white hicab',
      Icona: Icon(Icons.favorite_outline_outlined, color: colorRed),
      id: 1,
      price: 13.50,
      count: 1,
      counter: 13.50,
      toplam: 13.50),
  HicabData(
      ImageAsset: 'assets/images/ApiHicab3.png',
      text: 'yellow hicab',
      Icona: Icon(Icons.favorite_outline_outlined, color: colorRed),
      id: 2,
      price: 15.50,
      count: 1,
      counter: 15.50,
      toplam: 15.50),
  HicabData(
      ImageAsset: 'assets/images/ApiHicab1.jpg',
      text: 'white hicab',
      Icona: Icon(Icons.favorite_outline_outlined, color: colorRed),
      id: 3,
      price: 9.50,
      count: 1,
      counter: 9.50,
      toplam: 9.50),
  HicabData(
      ImageAsset: 'assets/images/ApiHicab2.png',
      text: 'black hicab',
      Icona: Icon(Icons.favorite_outline_outlined, color: colorRed),
      id: 4,
      price: 19.50,
      count: 1,
      counter: 19.50,
      toplam: 19.50),
  HicabData(
      ImageAsset: 'assets/images/ApiHicab3.png',
      text: 'yellow hicab',
      Icona: Icon(Icons.favorite_outline_outlined, color: colorRed),
      id: 5,
      price: 12.50,
      count: 1,
      counter: 12.50,
      toplam: 12.50),
  HicabData(
      ImageAsset: 'assets/images/ApiHicab1.jpg',
      text: 'black hicab',
      Icona: Icon(Icons.favorite_outline_outlined, color: colorRed),
      id: 6,
      price: 17.50,
      count: 1,
      counter: 17.50,
      toplam: 17.50),
  HicabData(
      ImageAsset: 'assets/images/ApiHicab3.png',
      text: 'white hicab',
      Icona: Icon(Icons.favorite_outline_outlined, color: colorRed),
      id: 7,
      price: 11.50,
      count: 1,
      counter: 11.50,
      toplam: 11.50),
];

// List<HicabData> Data3 = [
//   HicabData(
//       ImageAsset: 'assets/images/ApiHicab1.jpg',
//       text: 'black hicab',
//       Icona: Icon(Icons.favorite_outline_outlined, color: colorRed)),
//   HicabData(
//       ImageAsset: 'assets/images/ApiHicab2.png',
//       text: 'white hicab',
//       Icona: Icon(Icons.favorite_outline_outlined, color: colorRed)),
//   HicabData(
//       ImageAsset: 'assets/images/ApiHicab3.png',
//       text: 'yellow hicab',
//       Icona: Icon(Icons.favorite_outline_outlined, color: colorRed)),
//   HicabData(
//       ImageAsset: 'assets/images/ApiHicab1.jpg',
//       text: 'white hicab',
//       Icona: Icon(Icons.favorite_outline_outlined, color: colorRed)),
//   HicabData(
//       ImageAsset: 'assets/images/ApiHicab2.png',
//       text: 'black hicab',
//       Icona: Icon(Icons.favorite_outline_outlined, color: colorRed)),
//   HicabData(
//       ImageAsset: 'assets/images/ApiHicab3.png',
//       text: 'yellow hicab',
//       Icona: Icon(Icons.favorite_outline_outlined, color: colorRed)),
//   HicabData(
//       ImageAsset: 'assets/images/ApiHicab1.jpg',
//       text: 'black hicab',
//       Icona: Icon(Icons.favorite_outline_outlined, color: colorRed)),
//   HicabData(
//       ImageAsset: 'assets/images/ApiHicab3.png',
//       text: 'white hicab',
//       Icona: Icon(Icons.favorite_outline_outlined, color: colorRed)),
//   HicabData(
//       ImageAsset: 'assets/images/EtirPhoto1.jpg',
//       text: 'birinci etir',
//       Icona: Icon(Icons.favorite_outline_outlined, color: colorRed)),
//   HicabData(
//       ImageAsset: 'assets/images/EtirPhoto2.jpg',
//       text: 'ikinci etir',
//       Icona: Icon(Icons.favorite_outline_outlined, color: colorRed)),
//   HicabData(
//       ImageAsset: 'assets/images/EtirPhoto3.jpg',
//       text: 'ucuncu etir',
//       Icona: Icon(Icons.favorite_outline_outlined, color: colorRed)),
//   HicabData(
//       ImageAsset: 'assets/images/EtirPhoto4.jpg',
//       text: 'dorduncu etir',
//       Icona: Icon(Icons.favorite_outline_outlined, color: colorRed)),
//   HicabData(
//       ImageAsset: 'assets/images/EtirPhoto5.png',
//       text: 'besinci etir',
//       Icona: Icon(Icons.favorite_outline_outlined, color: colorRed)),
//   HicabData(
//       ImageAsset: 'assets/images/EtirPhoto1.jpg',
//       text: 'altinci etir',
//       Icona: Icon(Icons.favorite_outline_outlined, color: colorRed)),
//   HicabData(
//       ImageAsset: 'assets/images/EtirPhoto2.jpg',
//       text: 'yeddinci etir',
//       Icona: Icon(Icons.favorite_outline_outlined, color: colorRed)),
//   HicabData(
//       ImageAsset: 'assets/images/EtirPhoto3.jpg',
//       text: 'sekkizinci etir',
//       Icona: Icon(Icons.favorite_outline_outlined, color: colorRed)),
// ];

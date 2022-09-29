import 'package:flutter/material.dart';
import 'package:project_from_amirali/screens/hicabs.dart';
import 'package:project_from_amirali/useful_classes/hicab_data.dart';

class Etir extends StatelessWidget {
  String header1 = 'Etirler';
  // Icon icon1 = Icon(
  //   Icons.favorite_rounded,
  //   color: Colors.black,
  // );
  // Icon icona1 = Icon(
  //   Icons.favorite_outline,
  //   color: colorBlack,
  // );
  Etir({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hicabs(
      Data: Data2,
      header: header1,

      // icon: icon1,
    );
  }
}

List<HicabData> Data2 = [
  HicabData(
      ImageAsset: 'assets/images/EtirPhoto1.jpg',
      text: 'birinci etir',
      Icona: Icon(Icons.favorite_outline_outlined, color: colorRed),
      id: 8,price : 12.50,count : 1 ,counter : 12.50, toplam : 12.50),
  HicabData(
      ImageAsset: 'assets/images/EtirPhoto2.jpg',
      text: 'ikinci etir',
      Icona: Icon(Icons.favorite_outline_outlined, color: colorRed),
      id: 9,price : 25.50,count : 1,counter  : 25.50, toplam : 25.50),
  HicabData(
      ImageAsset: 'assets/images/EtirPhoto3.jpg',
      text: 'ucuncu etir',
      Icona: Icon(Icons.favorite_outline_outlined, color: colorRed),
      id: 10,price : 23.50,count : 1,counter : 23.50, toplam :  23.50),
  HicabData(
      ImageAsset: 'assets/images/EtirPhoto4.jpg',
      text: 'dorduncu etir',
      Icona: Icon(Icons.favorite_outline_outlined, color: colorRed),
      id: 11,price : 44.50,count : 1,counter : 44.50, toplam : 44.50) ,
  HicabData(
      ImageAsset: 'assets/images/EtirPhoto5.png',
      text: 'besinci etir',
      Icona: Icon(Icons.favorite_outline_outlined, color: colorRed),
      id: 12,price : 32.50,count : 1,counter : 32.50, toplam : 32.50) ,
  HicabData(
      ImageAsset: 'assets/images/EtirPhoto1.jpg',
      text: 'altinci etir',
      Icona: Icon(Icons.favorite_outline_outlined, color: colorRed),
      id: 13,price : 34.50,count : 1,counter : 34.50, toplam : 34.50) ,
  HicabData(
      ImageAsset: 'assets/images/EtirPhoto2.jpg',
      text: 'yeddinci etir',
      Icona: Icon(Icons.favorite_outline_outlined, color: colorRed),
      id: 14,price : 35.50,count : 1,counter : 35.50, toplam : 35.50) ,
  HicabData(
      ImageAsset: 'assets/images/EtirPhoto3.jpg',
      text: 'sekkizinci etir',
      Icona: Icon(Icons.favorite_outline_outlined, color: colorRed),
      id: 15,price : 36.50,count : 1,counter : 36.50 , toplam : 36.50) ,
];

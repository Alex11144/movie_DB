import 'package:flutter/material.dart';

import 'package:hive/hive.dart';

part 'hicab_data.g.dart';

@HiveType(typeId: 0)
class HicabData extends HiveObject {
  @HiveField(0)
  dynamic ImageAsset;

  @HiveField(1)
  dynamic text;

  @HiveField(2)
  dynamic Icona;

  @HiveField(3)
  dynamic id;
  @HiveField(4)
  dynamic price;
  @HiveField(5)
  dynamic counter = 1;
  @HiveField(6)
  dynamic count;
  @HiveField(7)
  double sum() {
    return counter = price * count;
  }

  @HiveField(8)
  dynamic toplam;

  HicabData(
      {this.text,
      this.ImageAsset,
      this.Icona,
      this.id,
      this.price,
      this.counter,
      this.count,
      this.toplam});
}

class Boxes {
  static Box<HicabData> getTransactions() => Hive.box<HicabData>('products');
}

class SepetBoxes {
  static Box<HicabData> getTransactions() => Hive.box<HicabData>('sepetBox');
}

class LoginBox {
  static Box getTransactions() => Hive.box('loginBox');
}

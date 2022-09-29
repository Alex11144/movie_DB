import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_from_amirali/Cards/products_row_cards.dart';

import 'package:project_from_amirali/useful_classes/hicab_data.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Color colorWhite = Colors.white;
Color colorRedcolorBlack = Colors.black;
Color colorRed = Colors.red;

// ignore: must_be_immutable
class Hicabs extends StatefulWidget {
  List<HicabData> Data;
  final String header;
  Hicabs({
    Key? key,
    required this.Data,
    required this.header,
  }) : super(key: key);

  @override
  State<Hicabs> createState() => _HicabsState();
}

class _HicabsState extends State<Hicabs> {
  // late SharedPreferences preferences;
  final controller = TextEditingController();

  void detailsWidget(context, int index) {
    var details = widget.Data[index];

    Navigator.of(context)
        .pushNamed('/main_screen/movie_details', arguments: details);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 390,
        height: 840,
        child: Scaffold(
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                    child: Text(
                      'Mehsullar',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: ProductsRow(),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                      child: Text(widget.header,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20)),
                    ),
                    Expanded(
                      child: ValueListenableBuilder<Box<HicabData>>(
                          valueListenable: Boxes.getTransactions().listenable(),
                          builder: (context, Box<HicabData> box, _) {
                            final transactions = SepetBoxes.getTransactions()
                                .values
                                .toList()
                                .cast<HicabData>();
                            return GridView.count(
                                padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                                mainAxisSpacing: 25,
                                scrollDirection: Axis.vertical,
                                controller:
                                    ScrollController(keepScrollOffset: false),
                                crossAxisCount: 2,
                                children:
                                    List.generate(widget.Data.length, (index) {
                                  HicabData product1 = widget.Data[index];

                                  // List<HicabData> boxValuesList =
                                  //     box.values.toList();
                                  HicabData products = HicabData(
                                      ImageAsset: product1.ImageAsset,
                                      text: product1.text,
                                      id: product1.id,
                                      price: product1.price,
                                      count: product1.count,
                                      counter: product1.counter,
                                      toplam: product1.toplam);

                                  return InkWell(
                                    onTap: () => detailsWidget(context, index),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Stack(
                                          alignment: Alignment.topRight,
                                          children: [
                                            Image.asset(products.ImageAsset,
                                                width: 160,
                                                height: 170,
                                                fit: BoxFit.fill),
                                            Material(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                color: Colors.transparent,
                                                child: IconButton(
                                                    onPressed: () {
                                                      // box.deleteAll(box.keys);
                                                      setState(() {
                                                        if (box.containsKey(
                                                                products.id) ==
                                                            false) {
                                                          box.put(products.id,
                                                              products);
                                                        } else {
                                                          box.delete(
                                                              products.id);
                                                        }
                                                      });
                                                    },
                                                    icon: box.containsKey(
                                                            products.id)
                                                        ? HicabData().Icona =
                                                            Icon(
                                                            Icons
                                                                .favorite_rounded,
                                                            color: colorRed,
                                                          )
                                                        : HicabData().Icona = Icon(
                                                            Icons
                                                                .favorite_outline_outlined,
                                                            color: colorRed)))
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Text(products.text),
                                      ],
                                    ),
                                  );
                                }).toList());
                          }),
                    ),
                  ]),
            ),
          ]),
        ),
      ),
    );
  }
}

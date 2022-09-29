import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


import 'package:project_from_amirali/screens/hicabs.dart';
import 'package:project_from_amirali/useful_classes/hicab_data.dart';

// double toplam2 = 0;

class DetailsScreenForHicabs extends StatefulWidget {
  final HicabData product1;
  DetailsScreenForHicabs({Key? key, required this.product1}) : super(key: key);

  @override
  State<DetailsScreenForHicabs> createState() => _DetailsScreenForHicabsState();
}

class _DetailsScreenForHicabsState extends State<DetailsScreenForHicabs> {
  // final box = Boxes.getTransactions();
  final sepetBox = SepetBoxes.getTransactions();
  late double endirimsiz = (widget.product1.price + 6) * widget.product1.count;

  void counterPlus() {
    widget.product1.count++;
    widget.product1.counter = widget.product1.price * widget.product1.count;
    endirimsiz = (widget.product1.price + 6) * widget.product1.count;
  }

  void counterMinus() {
    if (widget.product1.count > 1) {
      widget.product1.count--;
      widget.product1.counter = widget.product1.price * widget.product1.count;
      endirimsiz = (widget.product1.price + 6) * widget.product1.count;
    }
  }

  final buttonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.black54),
  );
  @override
  Widget build(BuildContext context) {
    // var args = ModalRoute.of(context)?.settings.arguments as HicabData;

    return Center(
      child: SizedBox(
        width: 390,
        height: 840,
        child: Scaffold(
          body: ValueListenableBuilder<Box<HicabData>>(
              valueListenable: Boxes.getTransactions().listenable(),
              builder: (context, box, _) {
                HicabData products = HicabData(
                    ImageAsset: widget.product1.ImageAsset,
                    text: widget.product1.text,
                    id: widget.product1.id,
                    price: widget.product1.price,
                    count: widget.product1.count,
                    counter: widget.product1.counter,
                    toplam: widget.product1.toplam);
                return Column(
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          products.ImageAsset,
                          fit: BoxFit.fitWidth,
                          width: 390,
                          height: 300,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.white24,
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.arrow_back,
                                      color: Colors.black,
                                    )),
                              ),
                              CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.white24,
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (box.containsKey(products.id) ==
                                              false) {
                                            box.put(products.id, products);
                                          } else {
                                            box.delete(products.id);
                                          }
                                        });
                                      },
                                      icon: box.containsKey(products.id)
                                          ? HicabData().Icona = Icon(
                                              Icons.favorite_rounded,
                                              color: colorRed,
                                            )
                                          : HicabData().Icona = Icon(
                                              Icons.favorite_outline_outlined,
                                              color: colorRed)))
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(products.text,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 17)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.share_outlined,
                                          size: 30))
                                ]),
                            RichText(
                                text: const TextSpan(children: [
                              TextSpan(
                                  text: "hicab",
                                  style: TextStyle(color: Colors.grey)),
                            ])),
                            const SizedBox(height: 15),
                            const Text(
                                "Burda mehsul haqqinda etrafli melumat elde etmek mumkundur")
                          ]),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                                text: TextSpan(children: [
                              const TextSpan(
                                  text: 'Qiymet\n',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 13)),
                              TextSpan(
                                  text: products.counter.toString() +
                                      '0' ' AZN\n',
                                  style: const TextStyle(
                                      color: Colors.red, fontSize: 25)),
                              TextSpan(
                                  text: endirimsiz.toString() + '0',
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 14)),
                            ])),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    style: buttonStyle,
                                    onPressed: () {
                                      setState(() {
                                        counterMinus();
                                        // totalPrice();
                                      });
                                    },
                                    child: const Icon(
                                      Icons.remove,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color.fromARGB(
                                          27, 158, 158, 158),
                                    ),
                                    width: 30,
                                    height: 30,
                                    child: Center(
                                        child: Text(products.count.toString())),
                                  ),
                                ),
                                ElevatedButton(
                                    style: buttonStyle,
                                    onPressed: () {
                                      setState(() {
                                        // print(args);
                                        counterPlus();
                                      });
                                    },
                                    child: const Icon(Icons.add)),
                              ],
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
                        child: SizedBox(
                            width: double.infinity,
                            height: 38,
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    if (sepetBox.containsKey(products.id) ==
                                        false) {
                                      sepetBox.put(products.id, products);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text('sepetden eklenildi'),
                                        // action: SnackBarAction(
                                        //     label: 'Iptal',
                                        //     onPressed: () {
                                        //       SepetBoxes.getTransactions().put(transactionDouble.id,
                                        //           transactionDouble);
                                        //     }),
                                      ));
                                    } else {
                                      sepetBox.delete(products.id);
                                      sepetBox.put(products.id, products);
                                      // null;
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text('Hal hazirda sepettedi'),
                                      ));
                                    }
                                  });
                                },
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(7))),
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color(0xFFE31E24))),
                                child: const Text('Sepete ekle'))))
                  ],
                );
              }),
        ),
      ),
    );
  }
}

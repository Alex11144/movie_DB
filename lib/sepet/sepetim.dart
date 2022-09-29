import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:project_from_amirali/useful_classes/hicab_data.dart';

class SepetWidget extends StatefulWidget {
  @override
  State<SepetWidget> createState() => _SepetWidgetState();
}

class _SepetWidgetState extends State<SepetWidget> {
  // final products =
  //     SepetBoxes.getTransactions().values.toList().cast<HicabData>();
  final buttonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.black54),
  );

  late double sum = 0;
  late double endirimsiz;
  // late double toplam;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 390,
          height: 840,
          child: Scaffold(
            body: ValueListenableBuilder(
                valueListenable: SepetBoxes.getTransactions().listenable(),
                builder: (context, box, _) {
                  final transactions = SepetBoxes.getTransactions()
                      .values
                      .toList()
                      .cast<HicabData>();
                  sumCart() {
                    return transactions
                        .map((e) => e.price * e.count)
                        .reduce((value, element) => value + element);
                  }

                  void detailsWidget(context, int index) {
                    var details = transactions[index];

                    Navigator.of(context).pushNamed(
                        '/main_screen/movie_details',
                        arguments: details);
                  }

                  return transactions.isNotEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ScrollConfiguration(
                                behavior: ScrollConfiguration.of(context)
                                    .copyWith(scrollbars: false),
                                child: ListView.separated(
                                    shrinkWrap: true,
                                    itemCount: transactions.length,
                                    separatorBuilder: ((context, index) =>
                                        const Divider()),
                                    itemBuilder: (context, index) {
                                      HicabData transactionDouble = HicabData(
                                          ImageAsset:
                                              transactions[index].ImageAsset,
                                          text: transactions[index].text,
                                          id: transactions[index].id,
                                          price: transactions[index].price,
                                          count: transactions[index].count,
                                          counter: transactions[index].counter,
                                          toplam: transactions[index].toplam);
                                      // sum = transactionDouble.price *
                                      //     transactionDouble.count;
                                      endirimsiz =
                                          (transactionDouble.price + 6) *
                                              transactionDouble.count;

                                      return Dismissible(
                                        direction: DismissDirection.endToStart,
                                        background: Container(
                                            alignment: Alignment.centerRight,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            color: const Color(0xFFE31E24),
                                            child: const Icon(
                                              Icons.delete_forever,
                                            )),
                                        key: ObjectKey(transactionDouble),
                                        onDismissed: (direction) {
                                          SepetBoxes.getTransactions()
                                              .delete(transactionDouble.id);
                                          setState(() {});
                                          switch (direction) {
                                            case DismissDirection.endToStart:
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: const Text(
                                                    'sepetden cixarildi'),
                                                action: SnackBarAction(
                                                    label: 'Iptal',
                                                    onPressed: () {
                                                      SepetBoxes
                                                              .getTransactions()
                                                          .put(
                                                              transactionDouble
                                                                  .id,
                                                              transactionDouble);
                                                    }),
                                              ));
                                              break;
                                            default:
                                              break;
                                          }
                                        },
                                        child: InkWell(
                                          onTap: () =>
                                              detailsWidget(context, index),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    // mainAxisAlignment:
                                                    //     MainAxisAlignment.end,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Image.asset(
                                                        transactionDouble
                                                            .ImageAsset,
                                                        fit: BoxFit.cover,
                                                        width: 100,
                                                        height: 100,
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Column(
                                                        // mainAxisAlignment:
                                                        //     MainAxisAlignment.end,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            transactionDouble
                                                                .text,
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          RichText(
                                                              text: TextSpan(
                                                                  children: [
                                                                const TextSpan(
                                                                    text:
                                                                        'Qiymet\n',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            13)),
                                                                TextSpan(
                                                                    text: transactionDouble
                                                                            .counter
                                                                            .toString() +
                                                                        '0'
                                                                            ' AZN\n',
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .red,
                                                                        fontSize:
                                                                            17)),
                                                                TextSpan(
                                                                    text: endirimsiz
                                                                            .toString() +
                                                                        '0',
                                                                    style: const TextStyle(
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            68,
                                                                            49,
                                                                            49),
                                                                        decoration:
                                                                            TextDecoration
                                                                                .lineThrough,
                                                                        fontSize:
                                                                            14)),
                                                              ])),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      const Text(
                                                        'Eded:',
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      const SizedBox(
                                                        width: 20,
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color: const Color
                                                                  .fromARGB(27,
                                                              158, 158, 158),
                                                        ),
                                                        width: 30,
                                                        height: 30,
                                                        child: Center(
                                                            child: Text(
                                                                transactionDouble
                                                                    .count
                                                                    .toString())),
                                                      ),
                                                      const SizedBox(
                                                        width: 50,
                                                      ),
                                                    ],
                                                  ),
                                                ]),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ),
                            Container(
                              height: 50,
                              color: Colors.black,
                              margin: const EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const Text(
                                            'Toplam : ',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                              sumCart().toString() +
                                                  '0' +
                                                  ' AZN',
                                              style: const TextStyle(
                                                  color: Colors.white))
                                        ],
                                      ),
                                      SizedBox(
                                        width: 175,
                                        height: 35,
                                        child: TextButton(
                                            style: TextButton.styleFrom(
                                                // minimumSize: material,
                                                primary: Colors.white,
                                                backgroundColor:
                                                    const Color(0xFFE31E24)),
                                            onPressed: () {},
                                            child: const Text('Sepeti onayla')),
                                      )
                                    ]),
                              ),
                            )
                          ],
                        )
                      : const Center(child: Text('sepet bosdur'));
                }),
          ),
        ),
      ),
      // persistentFooterButtons: [
      //   Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text('toplam'),
      //           Text(
      //             'sumCart().toString()',
      //             style: TextStyle(fontWeight: FontWeight.w500),
      //           )
      //         ],
      //       ),
      //       TextButton(
      //         onPressed: () {
      //           setState(() {});
      //         },
      //         child: Text('Sepeti Onayla'),
      //         style:
      //             TextButton.styleFrom(backgroundColor: Colors.orangeAccent),
      //       )
      //     ],
      //   )
      // ]
    );
  }
}

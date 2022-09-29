import 'package:flutter/material.dart';

import 'package:project_from_amirali/sepet/sepetim.dart';
import 'package:project_from_amirali/useful_classes/hicab_data.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class Change extends ChangeNotifier {
  var transactions = Boxes.getTransactions().values.toList().cast<HicabData>();

  // void searchProduct(String query) {
  //   final suggestions = Boxes.getTransactions().values.where((product) {
  //     final productTitle = product.text.toLowerCase();
  //     final input = query.toLowerCase();

  //     return  productTitle.contains(input);
  //   }).toList();

  //   transactions = suggestions;
  //    notifyListeners();
  // }

  void detailsWidget(context, int index) {
    var details = transactions[index];

    Navigator.of(context)
        .pushNamed('/main_screen/movie_details', arguments: details);
  }
// Change(){
//   searchProduct('');
// }
}

class SearchWidgetForHicabs extends StatefulWidget {
  const SearchWidgetForHicabs({Key? key}) : super(key: key);

  @override
  State<SearchWidgetForHicabs> createState() => _SearchWidgetForHicabsState();
}

class _SearchWidgetForHicabsState extends State<SearchWidgetForHicabs> {
  final controller = TextEditingController();
  // List<HicabData> secilmisler = [];

  @override
  Widget build(BuildContext context) {
    final watcher = context.watch<Change>();

    return Center(
      child: SizedBox(
        width: 390,
        height: 840,
        child: Scaffold(
            body: ValueListenableBuilder<Box<HicabData>>(
                valueListenable: Boxes.getTransactions().listenable(),
                builder: (context, box, _) {
                  watcher.transactions =
                      Boxes.getTransactions().values.toList().cast<HicabData>();

                  return DefaultTabController(
                    length: 2,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                      child: Column(children: [
                        SizedBox(
                        height: 37,
                        
                          width: double.maxFinite,
                          child: const TabBar(
                              // isScrollable: true,
                              labelColor: Color(0xFFE31E24),
                              unselectedLabelColor: Colors.grey,
                              indicatorColor: Color(0xFFE31E24),
                              indicatorWeight: 2.0,
                              tabs: [
                                Text('Favorilerim'),
                                Text('Sepetim'),
                              ]),
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: TextField(
                            controller: controller,
                            // onChanged: watcher.searchProduct,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.search),
                                hintText: 'Product Title',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.blue))),
                            // onChanged: searchProduct,
                          ),
                        ),
                        SizedBox(
                          height: 620,
                          width: double.maxFinite,
                          child: TabBarView(children: [
                            watcher.transactions.isNotEmpty
                                ? Center(
                                    child: ScrollConfiguration(
                                    behavior: ScrollConfiguration.of(context)
                                        .copyWith(scrollbars: false),
                                    child: ListView.separated(
                                        // shrinkWrap: true,
                                        itemCount: watcher.transactions.length,
                                        separatorBuilder: ((context, index) =>
                                            const Divider()),
                                        itemBuilder: (context, index) {
                                          HicabData transactionDouble =
                                              HicabData(
                                                  ImageAsset: watcher
                                                      .transactions[index]
                                                      .ImageAsset,
                                                  text: watcher
                                                      .transactions[index].text,
                                                  id: watcher
                                                      .transactions[index].id,
                                                  price: watcher
                                                      .transactions[index]
                                                      .price,
                                                  count: watcher
                                                      .transactions[index]
                                                      .count,
                                                  counter: watcher
                                                      .transactions[index]
                                                      .counter,
                                                  toplam: watcher
                                                      .transactions[index]
                                                      .toplam);

                                          return Dismissible(
                                            direction:
                                                DismissDirection.endToStart,
                                            background: Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20),
                                                color: const Color(0xFFE31E24),
                                                child: const Icon(
                                                  Icons.delete_forever,
                                                )),
                                            key: ObjectKey(transactionDouble),
                                            onDismissed: (direction) {
                                              box.delete(transactionDouble.id);
                                              setState(() {});
                                              switch (direction) {
                                                case DismissDirection
                                                    .endToStart:
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                    content: const Text(
                                                        'favorilerden cixarildi'),
                                                    action: SnackBarAction(
                                                        label: 'Iptal',
                                                        onPressed: () {
                                                          box.put(
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
                                            child: Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                hoverColor: Colors.transparent,
                                                onTap: () =>
                                                    watcher.detailsWidget(
                                                        context, index),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(children: [
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Image.asset(
                                                                transactionDouble
                                                                    .ImageAsset,
                                                                fit: BoxFit
                                                                    .cover,
                                                                width: 100,
                                                                height: 100,
                                                              ),
                                                              const SizedBox(
                                                                width: 10,
                                                              ),
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    transactionDouble
                                                                        .text,
                                                                    style: const TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                  ),
                                                                  Text(
                                                                    transactionDouble
                                                                            .text +
                                                                        ' haqqinda ...',
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .grey),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          TextButton(
                                                              style: TextButton.styleFrom(
                                                                  primary: Colors
                                                                      .white,
                                                                  backgroundColor:
                                                                      const Color(
                                                                          0xFFE31E24)),
                                                              onPressed: () {
                                                                if (SepetBoxes
                                                                            .getTransactions()
                                                                        .containsKey(
                                                                            transactionDouble.id) ==
                                                                    false) {
                                                                  SepetBoxes.getTransactions().put(
                                                                      transactionDouble
                                                                          .id,
                                                                      transactionDouble);
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                          const SnackBar(
                                                                    content: Text(
                                                                        'sepete eklenildi'),
                                                                    // action: SnackBarAction(
                                                                    //     label: 'Iptal',
                                                                    //     onPressed: () {
                                                                    //       SepetBoxes.getTransactions().put(transactionDouble.id,
                                                                    //           transactionDouble);
                                                                    //     }),
                                                                  ));
                                                                } else {
                                                                  null;
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                          const SnackBar(
                                                                    content: Text(
                                                                        'Hal hazirda sepettedi'),
                                                                    // action: SnackBarAction(
                                                                    //     label: 'Iptal',
                                                                    //     onPressed: () {
                                                                    //       SepetBoxes.getTransactions().put(transactionDouble.id,
                                                                    //           transactionDouble);
                                                                    //     }),
                                                                  ));
                                                                  // sepetBox.(widget.product1.id);
                                                                }
                                                                setState(() {});
                                                              },
                                                              child: const Text(
                                                                  'Sepete ekle')),
                                                        ]),
                                                    // const Divider(
                                                    //   height: 2,
                                                    // )
                                                  ]),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  ))
                                : const Center(
                                    child: Text('Favoriler secilmeyib')),
                            Center(child: SepetWidget()),
                          ]),
                        )
                      ]),
                    ),
                  );
                })),
      ),
    );
  }
}

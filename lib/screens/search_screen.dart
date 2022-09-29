import 'package:flutter/material.dart';

import 'package:project_from_amirali/screens/Etirler.dart';
import 'package:project_from_amirali/screens/HicabMehsullari.dart';
import 'package:project_from_amirali/screens/hicabs.dart';
import 'package:project_from_amirali/useful_classes/hicab_data.dart';

class SearchWidget extends StatefulWidget {
  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();
  List<HicabData> product = Hicabs(
    Data: List.from(Data1)..addAll(Data2),
    header: 'hello',
  ).Data;
   List<HicabData> product1 = Hicabs(
    Data: List.from(Data1)..addAll(Data2),
    header: 'hello',
  ).Data;
  void detailsWidget(context, int index) {
    var details = product[index];

    Navigator.of(context)
        .pushNamed('/main_screen/movie_details', arguments: details);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 390,
        height: 840,
        child: Scaffold(
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(16),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Product Title',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.blue))),
                  onChanged: searchProduct,
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: product.length,
                      itemBuilder: (context, index) {
                        HicabData products = HicabData(
                            ImageAsset: product[index].ImageAsset,
                            text: product[index].text,
                            id: product[index].id,
                            price: product[index].price,
                            count: product[index].count,
                            counter: product[index].counter);
                        return Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                            child: ListTile(
                                subtitle: Text(
                                  products.price.toString() + ' AZN',
                                  style: const TextStyle(fontSize: 13),
                                ),
                                leading: Image.asset(
                                  products.ImageAsset,
                                  fit: BoxFit.cover,
                                  width: 50,
                                  height: 50,
                                ),
                                title: Text(products.text),
                                onTap: () => detailsWidget(context, index)));
                      }))
            ],
          ),
        ),
      ),
    );
  }

  void searchProduct(String query) {
    final suggestions = product1.where((product) {
      final productTitle = product.text.toLowerCase();
      final input = query.toLowerCase();

      return productTitle.contains(input);
    }).toList();
    setState(() {
      product = suggestions;
    });
  }
}

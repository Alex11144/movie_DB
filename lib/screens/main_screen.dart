import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_from_amirali/Cards/Containers_sections.dart';

import 'package:project_from_amirali/Cards/products_row_cards.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  late Timer _timer;
  static DateTime now = DateTime.now();
  String formatter = DateFormat('hh:mm').format(now);
  late String _timeString;
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    _timer =
        Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm:ss').format(dateTime);
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  Color color = const Color.fromARGB(81, 255, 255, 255);
  Color textColor = Colors.white;
  List<bool> isSelected = [
    true,
    false,
    false,
    false,
  ];
  List namazNames = ['Fecr', 'Gun cixir', 'Zohr', 'Esr'];
  List namazTimes = [
    DateTime.parse("2012-02-27 04:53:00"),
    DateTime.parse("2012-02-27 07:27:00"),
    DateTime.parse("2012-02-27 11:45:00"),
    DateTime.parse("2012-02-27 15:57:00"),
  ].map((e) => DateFormat("hh:mm").format(e)).toList();

  String namazName = 'Fecr';
  String namazLeftTime = '06:24';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 840,
        width: 390,
        child: Scaffold(
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: const Color(0xFFE31E24)),
                width: MediaQuery.of(context).size.width,
                height: 180,
                child: Stack(
                  fit: StackFit.expand,
                  alignment: AlignmentDirectional.centerEnd,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                      child: SvgPicture.asset(
                        'assets/images/Vector.svg',
                        fit: BoxFit.fitHeight,
                        // width: 200,
                        height: 189,
                      ),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                    text: "$namazName\n",
                                    style: const TextStyle(
                                        height: 1,
                                        color: Colors.white,
                                        fontSize: 15),
                                  ),
                                  TextSpan(
                                    text: "$namazLeftTime\n",
                                    style: const TextStyle(
                                        height: 1.2,
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  TextSpan(
                                    text: '$_timeString',
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100),
                                  ),
                                ]))
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                              child: SizedBox(
                                height: 50,
                                child: Center(
                                  child: ToggleButtons(
                                      borderRadius: BorderRadius.circular(20),
                                      selectedBorderColor: Colors.transparent,
                                      borderColor: Colors.transparent,
                                      fillColor: Colors.white,
                                      renderBorder: true,
                                      selectedColor: Colors.black,
                                      color: Colors.white,
                                      borderWidth: 5,
                                      children: [
                                        sections(
                                            text1: 'Fecr',
                                            text2: namazTimes[0],
                                            id: 1),
                                        sections(
                                            text1: 'Gun cixir',
                                            text2: namazTimes[1],
                                            id: 2),
                                        sections(
                                            text1: "Zohr",
                                            text2: namazTimes[2],
                                            id: 3),
                                        sections(
                                            text1: 'Esr',
                                            text2: namazTimes[3],
                                            id: 4),
                                      ],
                                      isSelected: isSelected,
                                      onPressed: (int index) {
                                        setState(() {
                                          for (int buttonIndex = 0;
                                              buttonIndex < isSelected.length;
                                              buttonIndex++) {
                                            if (buttonIndex == index) {
                                              isSelected[buttonIndex] =
                                                  !isSelected[buttonIndex];
                                              // color = textColor;
                                              namazName =
                                                  namazNames[buttonIndex];
                                              namazLeftTime =
                                                  namazTimes[buttonIndex];
                                            } else {
                                              isSelected[buttonIndex] = false;
                                            }
                                          }
                                        });
                                      }),
                                ),
                              )),
                        ]),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
              child: Text("Mehsullar",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  ProductsRow(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 15),
                    child: Divider(),
                  ),
                  ProductsRow(),
                  SizedBox(
                    height: 10,
                  ),
                  ProductsRow(),
                ],
              ),
            ),
          ]),
          // bottomNavigationBar: const BottomNavBar(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:project_from_amirali/screens/Etirler.dart';
import 'package:project_from_amirali/screens/HicabMehsullari.dart';

class HesabWidget extends StatelessWidget {
  const HesabWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 840,
        width: 390,
        child: Scaffold(
            body: CustomScrollView(
          slivers: [ProfileAndId(), Sliver2()],
        )),
      ),
    );
  }
}

class ProfileAndId extends StatelessWidget {
  const ProfileAndId({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: const Color(0xFFE31E24),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 35, 15, 0),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 30,
                              child: Icon(Icons.person),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                RichText(
                                    text: const TextSpan(children: [
                                  TextSpan(text: 'ID 12382974\n'),
                                  TextSpan(
                                      text: '(055) 382-60-64',
                                      style: TextStyle(fontSize: 11))
                                ]))
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                              icon: const Icon(Icons.settings_outlined),
                              color: Colors.white,
                              onPressed: () {
                                Navigator.of(context).pushNamed("register");

                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: ((context) =>
                                //         RegistrationWidget())));
                              }),
                          IconButton(
                              iconSize: 20,
                              onPressed: () {},
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.white,
                              )),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.white,
                          size: 15,
                        ),
                        Text(
                          '1.09.2022 tarixinden verifikasiyadan kecib',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Sexsi hesab',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 13),
                                    ),
                                    Text(
                                      '0.00 AZN',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                    onPressed: () {},
                                    child: const Text("Artir"))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: ((context, index) {
                            final routes = [Etir(), Etir(), Etir()];
                            final routesText = [
                              'Sexsi hesab uzre emeliyyatlar',
                              'Elanlarima olan odenisler',
                              'Elan limiti'
                            ];
                            final routesIcons = [
                              const Icon(Icons.wallet),
                              const Icon(Icons.refresh),
                              const Icon(Icons.photo)
                            ];
                            return Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              routes[index])));
                                },
                                child: ListTile(
                                  leading: routesIcons[index],
                                  trailing: const Icon(Icons.arrow_right),
                                  title: Text(routesText[index]),
                                ),
                              ),
                            );
                          }),
                          separatorBuilder: ((context, index) => const Divider(
                                height: 2,
                              ))),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Sliver2 extends StatelessWidget {
  const Sliver2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 900,
        width: double.maxFinite,
        child: DefaultTabController(
          length: 4,
          child: Column(
            children: const [
              SizedBox(
                height: 35,
                width: double.maxFinite,
                child: TabBar(
                    isScrollable: true,
                    labelColor: Color(0xFFE31E24),
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Color(0xFFE31E24),
                    indicatorWeight: 2.0,
                    tabs: [
                      Text('Hazirda saytda'),
                      Text('Muddeti basa catmis'),
                      Text('Gozlemede'),
                      Text('Derc olunmamis'),
                    ]),
              ),
              SizedBox(
                height: 300,
                width: double.maxFinite,
                child: TabBarView(children: [
                  Center(
                      child: Text(
                    'Bu bolmede elan yoxdur',
                    style: TextStyle(color: Colors.grey),
                  )),
                  Center(
                      child: Text(
                    'Bu bolmede elan yoxdur',
                    style: TextStyle(color: Colors.grey),
                  )),
                  Center(
                      child: Text(
                    'Bu bolmede elan yoxdur',
                    style: TextStyle(color: Colors.grey),
                  )),
                  Center(
                      child: Text(
                    'Bu bolmede elan yoxdur',
                    style: TextStyle(color: Colors.grey),
                  )),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

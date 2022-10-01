import 'package:flutter/material.dart';

class MovieDetailsMainScreenCastWidget extends StatelessWidget {
  const MovieDetailsMainScreenCastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Series Cast',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: 250,
            child: Scrollbar(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemExtent: 120,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.2)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2))
                              ]),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(8)),
                            clipBehavior: Clip.hardEdge,
                            child: Column(
                              children: [
                                const Image(
                                    image: AssetImage(
                                        'assets/images/tomClancy2.jpg')),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Steven Yeun',
                                        maxLines: 1,
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        'Mark Grayson / Invincible (voice)',
                                        maxLines: 4,
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        '8 Episodes',
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ));
                  }),
            ),
          ),
          const Padding(
              padding: EdgeInsets.all(3.0),
              child: Text(
                'Full Cast & Crew',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
              ))
        ],
      ),
    );
  }
}
